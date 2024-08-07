import 'package:dar_com/controller/login/login_controller.dart';
import 'package:dar_com/native_storage/secure_storage.dart';
import 'package:get/get.dart';

class RentLayoutController extends GetxController{
  late SecureStorage _storage;
   RxBool checkTokenIsValid=false.obs;
  @override
  void onInit() async {
    _storage=SecureStorage();
    await checkToken();
    super.onInit();
  }
  Future<void> checkToken()async {
    String? token=await _storage.read('token');
    print(token);
    if(token!=null){
      checkTokenIsValid.value=!checkTokenIsValid.value;
    }else{
      checkTokenIsValid.value=false;
    }
  }
}