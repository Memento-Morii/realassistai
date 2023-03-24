import 'package:get/get.dart';

import 'http/http_service.dart';
import 'http/http_service_impl.dart';

class MainServices extends GetxService {
  late HttpService _httpServiceImpl;

  @override
  void onInit() async {
    initializeHttpService();
    super.onInit();
  }

  initializeHttpService() {
    Get.put(HttpServiceImpl(), permanent: true);
    _httpServiceImpl = Get.find<HttpServiceImpl>();
    _httpServiceImpl.init();
  }
}
