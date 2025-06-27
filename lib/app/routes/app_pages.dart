import 'package:e_commerce/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';

import '../modules/base_controller/bindings/base_controller_bindings.dart';
import '../modules/base_controller/views/base_controller_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.BASE,
      page: () => BaseControllerView(),
      binding: BaseControllerBinding(),
    ),
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
