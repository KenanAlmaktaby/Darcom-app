import 'package:dar_com/controller/login/login_controller.dart';
import 'package:dar_com/controller/rent_layout/rent_layout_controller.dart';
import 'package:get/get.dart';

class RentLayoutBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<RentLayoutController>(RentLayoutController());
    Get.put(LoginController(),permanent: true);
  }

}