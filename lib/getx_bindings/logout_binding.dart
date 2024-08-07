import 'package:dar_com/controller/logout/logout_controller.dart';
import 'package:get/get.dart';

class LogoutBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<LogoutController>(LogoutController());
  }

}