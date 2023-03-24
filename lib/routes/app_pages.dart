import 'package:get/get.dart';
import 'package:realassistai/views/homepage/bindings/homepage_binding.dart';
import 'package:realassistai/views/homepage/homepage_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomepageView(),
      binding: HomepageBinding(),
    ),
  ];
}
