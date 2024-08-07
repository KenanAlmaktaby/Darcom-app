import 'package:dar_com/controller/login/login_controller.dart';
import 'package:dar_com/controller/profile/profile_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';

class ProfileUserScreen extends StatelessWidget {
  ProfileController profileController=Get.find();
  LoginController loginController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,'User Profile'),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 5.h,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    loginController.name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(onPressed: (){
                    goto(context, '/editProfile');
                  }, icon:Icon( Icons.edit,size: 15.sp,color: bb,)),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                loginController.emailUser,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: lbb,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h,),
          NumbersWidget(numPropertySale: 12,
            numPropertyRent: 4,
            numSoldProperties: 5,
            numRentalProperties: 0,
          ),
          SizedBox(height: 3.h,),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60.h,
                  child:PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 20.w,
                      sections: getSections(context , 12,
                          4,
                          5,
                          0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: IndicatorWidget(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
