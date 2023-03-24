import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:realassistai/model/message_model/message.dart';
import 'package:realassistai/themes/custom_colors.dart';
import 'package:realassistai/themes/theme_text.dart';
import 'package:realassistai/views/homepage/homepage_drawer.dart';
import 'package:realassistai/views/homepage/subscribe_view.dart';
import 'package:realassistai/widgets/custom_list_tile.dart';
import 'package:realassistai/widgets/primary_button.dart';

import '../../widgets/custom_text_field.dart';
import 'controller/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomepageDrawer(),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Real Assist AI',
              style: ThemeText.bodyBoldOne,
            ),
            Text(
              'This is private message, between you and Assitant',
              style: ThemeText.bodyThree,
            ),
          ],
        ),
      ),
      body: Obx(
        () => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.only(bottom: Get.height * 0.07),
                height: Get.height * .75,
                child: controller.messages.isEmpty
                    ? controller.isSubscribe.isTrue
                        ? const SubscribeView()
                        : SingleChildScrollView(
                            child: SizedBox(
                              height: Get.height * .75,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Example of types of question to ask RealAssist',
                                    style: ThemeText.headlineOne,
                                  ),
                                  const SizedBox(height: 30),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: controller.questions.length,
                                    itemBuilder: (context, i) {
                                      return questionWidget(
                                          controller.questions[i]);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: PrimaryButton(
                                      height: 50,
                                      width: 150,
                                      label: "Subscribe",
                                      onPressed: () =>
                                          controller.isSubscribe.value = true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                    : ListView.builder(
                        reverse: true,
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          return controller.isLoading.isTrue && index == 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    messageWidget(
                                      controller.messages.reversed
                                          .toList()[index]!,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        const SpinKitThreeBounce(
                                          color: CustomColors.primaryColor,
                                          size: 10.0,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Real Assist AI is thinking...',
                                          style: ThemeText.bodyOne.copyWith(
                                            color: CustomColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : messageWidget(controller.messages.reversed
                                  .toList()[index]!);
                        },
                      ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    CustomTextField(
                      // fillColor: Colors.grey[200],
                      width: Get.width * .8,
                      hintText: "Message",
                      controller: controller.messageController,
                      // style: ThemeText.bodyOne,
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () => controller
                          .sendChat(controller.messageController.text),
                      child: const CircleAvatar(
                        backgroundColor: Color(0xff304CEF),
                        child: Icon(
                          Iconsax.send_1,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget messageWidget(Message message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: message.isMyMessage == true ? Colors.transparent : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.text,
            style: ThemeText.bodyOne,
          ),
          const SizedBox(height: 10),
          Text(
            DateFormat.jm().format(message.dateTime),
            style: ThemeText.bodyThree,
          ),
        ],
      ),
    );
  }

  Widget questionWidget(String question) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: CustomListTile(
        onPressed: () =>
            controller.isLoading.isTrue ? null : controller.sendChat(question),
        titleWidget: Text(
          question,
          style: ThemeText.bodyBoldOne,
        ),
        trailingWidget: const Icon(
          Icons.arrow_outward_rounded,
          color: Color(0xff304CEF),
        ),
      ),
    );
  }
}
