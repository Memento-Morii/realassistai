import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../themes/custom_colors.dart';
import '../../themes/theme_text.dart';
import '../../widgets/primary_button.dart';

class SubscribeView extends StatelessWidget {
  const SubscribeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height * .75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'The Right Clauses Every Time: Generate Custom Legal Clauses with RealAssist.Ai',
              style: ThemeText.headlineOne,
            ),
            const SizedBox(height: 30),
            Text(
              'Specfically desgined to support the needs of real estate agents by providing an automated solution for generating custom legals clauses, streaming your workflows',
              style: ThemeText.headlineThree.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 50),
            PrimaryButton(
              height: 50,
              width: 200,
              label: "Try RealAssist for Free",
              onPressed: () {},
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Icon(
                  Iconsax.tick_square,
                  color: CustomColors.primaryColor,
                ),
                const SizedBox(width: 20),
                Text(
                  '5 Free Responses',
                  style: ThemeText.bodyOne.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(
                  Iconsax.tick_square,
                  color: CustomColors.primaryColor,
                ),
                const SizedBox(width: 20),
                Text(
                  'Cancel Anytime',
                  style: ThemeText.bodyOne.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
