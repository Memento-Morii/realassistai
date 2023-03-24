import 'package:get/get.dart';
import 'package:realassistai/services/message/message_service_impl.dart';

import '../controller/homepage_controller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MessageServiceImpl());
    Get.put(HomepageController());
  }
}
