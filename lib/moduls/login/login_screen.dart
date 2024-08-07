

import 'package:dar_com/controller/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginController loginController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: w2,
      appBar: AppBar(
        backgroundColor: bb,
        title:  Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: w1,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity.w,
            height: double.infinity.h,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity.w,
            height: double.infinity.h,
            color: w3,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(height: 20.h,),
                        Text(
                          'WELCOME',
                          style: TextStyle(
                            color: bb,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        width: double.infinity.w,
                        height: 0.2.h,
                        color: bb,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 5.w, end: 5.w, bottom: 5.h),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: userEmailController,
                        validator: (value) {
                          if (value!.isEmpty) return 'Email can\'t be embty';
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your Email..',
                          prefixIcon: Icon(
                            Icons.attach_email_outlined,
                            color: bb,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          loginController.email=value;
                        },
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.w),
                      child: Obx(()=>TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: userPasswordController,
                        obscureText: loginController.flag.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password can\t be embty';
                          }
                          if (value.length < 6) {
                            return ' Password can\'t be lees than 6 character';
                          }
                          return null;
                          },
                        decoration: InputDecoration(
                          hintText: 'Enter Password..',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: bb,
                          ),
                          suffixIcon: IconButton(
                            icon:loginController.flag.value?Icon(Icons.visibility_off):Icon(Icons.visibility),
                            onPressed: (){
                              loginController.change();
                            },
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          loginController.password=value;
                        },
                      ),),
                    ),
                    SizedBox(height: 5.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        width: double.infinity.w,
                        height: 0.2.h,
                        color: bb,
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Checkbox(
                            value:loginController.checkBoxStatus.value,
                            activeColor: bb,
                            onChanged: (bool? value) {
                              loginController.changeChekBox();
                            },
                          ),),
                          Text('Keep Login..',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: bb,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    buildButton(context, 'Login', () {
                      if (_formKey.currentState!.validate()) {
                        onClickLogin();
                      }
                    }),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            'new here?',
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.back();
                                goto(context,'/register');
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: lbb,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onClickLogin() async{
    EasyLoading.show(status: 'loading...');
    await loginController.loginOnClick();
    if(loginController.loginStatus){
      EasyLoading.showSuccess(loginController.message);
      loginController.isGo.value=true;
      Get.offNamed('/profile');
    }
    else{
      EasyLoading.showError('${loginController.message}: wrong email or password');
      print('error here');
    }
  }

}
