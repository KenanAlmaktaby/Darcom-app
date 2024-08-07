import 'dart:async';

import 'package:get/get.dart';

class LeadingController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(Duration(seconds: 8), navigatetopage);
  }
  void navigatetopage() {
    Get.offAllNamed('/rentSaleLayout');
  }
}