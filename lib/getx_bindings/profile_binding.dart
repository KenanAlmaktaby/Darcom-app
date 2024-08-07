import 'package:dar_com/controller/login/login_controller.dart';
import 'package:dar_com/controller/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
    Get.put(LoginController(),permanent: true);
  }

}