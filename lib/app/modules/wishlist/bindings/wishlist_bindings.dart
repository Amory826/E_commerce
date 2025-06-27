import 'package:e_commerce/app/modules/profile/controllers/profile_controller.dart';
import 'package:e_commerce/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:get/get.dart';

class WishlistBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(() => WishlistController());
  }
}
