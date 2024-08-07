
import 'package:dar_com/controller/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/styles.dart';

class EditProfileUserScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    LoginController loginController=Get.find();
    return Scaffold(
      appBar: buildAppBar(context,'Edit Profile'),
      body: ListView(
        padding: EdgeInsets.all(18.sp),
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 5.h,),
          TextFiledWidget(
              label:'full Name',
              text:loginController.name,
              onChanged:(name){
              }
          ),
          SizedBox(height: 2.h,),
          TextFiledWidget(
              label:'Email',
              text:loginController.emailUser,
              onChanged:(email){
              }
          ),
          SizedBox(height: 2.h,),
          TextFiledWidget(
              label:'Phone Number',
              text:'+963  ${loginController.phone}',
              onChanged:(phone){
                phone=loginController.phone as String;
              }
          ),
          SizedBox(height: 5.h,),
          buildButton(context, 'Save', (){
            Navigator.pop(context);
            goto(context, '/profile');
          })
        ],
      ),
    );
  }
}
