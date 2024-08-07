import 'dart:convert';
import 'dart:io';
import 'package:dar_com/controller/register/register_controller.dart';
import 'package:dar_com/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../login/login_screen.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userphone = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterController registerController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: w2,
      appBar: AppBar(
        backgroundColor: bb,
        title: const Text(
          'Register',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xA8FFFFFC),
          ),
        ),
      ),
      body: Stack(children: [
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
                  Image(image: AssetImage('assets/images/register.png'),),
                  SizedBox(
                    width: 5.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      width: double.infinity.w,
                      height: 0.2.h,
                      color: bb,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) return 'name can\'t be Empty';
                        return null;
                      },
                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your name..',
                        prefixIcon: Icon(
                          Icons.account_box_outlined,
                          color: bb,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value){
                        registerController.name=value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 5.w, end: 5.w, bottom: 3.h),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: userEmailController,
                      validator: (value) {
                        if (value!.isEmpty) return 'Email can\'t be Embty';
                        if (value.contains('@') & value.contains('.'))
                          return null;
                        else
                          return 'Email should contain @ and .';
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
                        registerController.email=value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 5.w, end: 5.w, bottom: 3.h),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: userphone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number can\'t be embty';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Phone Number..',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: bb,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value){
                        registerController.phone=value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 5.w, end: 5.w, bottom: 3.h),
                    child: Obx(()=>TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: registerController.flag.value,
                      controller: userPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password can\'t be Embty';
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
                          icon: registerController.flag.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            print(registerController.flag.value);
                            registerController.change1();
                          },
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value){
                        registerController.password=value;
                      },
                    ),),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      width: double.infinity.w,
                      height: 0.2.h,
                      color: bb,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  buildButton(
                    context,
                    'Register',
                    () {
                      if (_formKey.currentState!.validate()) {
                        onClickRegister();
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          'already have an account?',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.back();
                              goto(context, '/login');
                            },
                            child: Text(
                              'login',
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
      ]),
    );
  }
  void onClickRegister() async{
    EasyLoading.show(status: 'loading...');
     await registerController.registerOnClick();
     if(registerController.registerStatus){
       EasyLoading.showSuccess(registerController.message);
       Get.offNamed('/login');
     }
     else{
       EasyLoading.showError('something wrong:\n check your info...');
       print('error here');
     }
  }
}
