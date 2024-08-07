import 'package:dar_com/models/user.dart';
import 'package:dar_com/services/register/register_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var name = '';
  var email = '';
  var password = '';
  var phone = '';

  RegisterService service = RegisterService();
  var registerStatus = false;
  var message;

  RxBool flag = true.obs;
  RxBool flag2 = true.obs;
  RxBool isEdit = false.obs;

  Future<void> registerOnClick() async {
    User user = new User(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    registerStatus= await service.register(user);
    message=service.message;

  }



  bool changeEdit() {
    isEdit.value = !isEdit.value;
    return isEdit.value;
  }

  void change1() {
    flag.value = !flag.value;
  }

  void change2() {
    flag2.value = !flag2.value;
  }
}
