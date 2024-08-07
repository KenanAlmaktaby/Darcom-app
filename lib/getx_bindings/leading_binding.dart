import 'package:dar_com/controller/leading/leading_controller.dart';
import 'package:get/get.dart';

class LeadingBinding implements Bindings{
  @override
  void dependencies() {
   Get.put<LeadingController>(LeadingController());
  }

}