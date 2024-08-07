import 'package:dar_com/services/login/login_service.dart';
import 'package:get/get.dart';

import '../../models/user.dart';

class LoginController extends GetxController{
  var email;
  var password;
  var loginStatus;
  var message;
  var name;
  var emailUser;
  var phone;
  late LoginService service;

  @override
  void onInit() {
    super.onInit();
    email='';
    password='';
    loginStatus=false;
    message='';
    name='';
    emailUser='';
    phone='';
    service=LoginService();
  }

  RxBool checkBoxStatus=false.obs;
  RxBool flag=true.obs;
  RxBool isGo=false.obs;

  Future<void> loginOnClick() async {
    User user = new User(
      email: email,
      password: password,
    );
    loginStatus = await service.login(user,checkBoxStatus.value);
    message=service.message;
    name=service.name;
    emailUser= service.email;
    phone=service.phone;
  }
  void changeChekBox() {
    checkBoxStatus.value=!checkBoxStatus.value;

  }

  void change(){
    flag.value=!flag.value;
  }
}