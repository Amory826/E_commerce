import 'package:e_commerce/app/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../../home/bindings/home_binding.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
