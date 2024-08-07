import 'dart:async';

import 'package:dar_com/controller/leading/leading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../layout/rent_sale_layout/rent_sale_layout_screen.dart';
import '../../shared/styles/colors.dart';

class LeadingScreen extends StatelessWidget {
   LeadingScreen({Key? key}) : super(key: key);
  LeadingController controller=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
            color: bb,
          child: Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/house21.gif'),
                    ),
                    Text(
                      'DAR.COM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        fontStyle: FontStyle.italic,
                        color: w4,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
