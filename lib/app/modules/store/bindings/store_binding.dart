import 'package:e_commerce/app/modules/store/controllers/store_controller.dart';
import 'package:get/get.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(() => StoreController());
  }
}
