import 'package:get/get.dart';

import '../../home/bindings/home_binding.dart';
import '../controllers/base_controller_controller.dart';

class BaseControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseControllerController>(() => BaseControllerController());
    HomeBinding().dependencies();
  }
}
