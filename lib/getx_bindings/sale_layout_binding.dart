import 'package:dar_com/controller/sale_layout/sale_layout_controller.dart';
import 'package:get/get.dart';

import '../controller/login/login_controller.dart';

class SaleLayoutBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<SaleLayoutController>(SaleLayoutController());
    Get.put(LoginController(),permanent: true);
  }

}