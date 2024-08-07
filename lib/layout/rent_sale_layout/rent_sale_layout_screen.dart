import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../rent_lauout/rent_layout_screen.dart';
import '../sale_layout/sale_layout_screen.dart';

class RentSaleScreen extends StatefulWidget {
  const RentSaleScreen({Key? key}) : super(key: key);

  @override
  State<RentSaleScreen> createState() => _RentSaleScreenState();
}

class _RentSaleScreenState extends State<RentSaleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: w4,
      body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children:[
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                width:double.infinity.w,
                child: Image.asset('assets/images/property1.png',
                  fit: BoxFit.cover,),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                alignment: AlignmentDirectional.topCenter,
                padding: EdgeInsetsDirectional.only(top: 12.h),
                child: Image.asset('assets/images/title_app.gif',
                  fit: BoxFit.cover,),
              ),
            ) ,
            Align(
              alignment: Alignment(0.0.w,-0.1.h),
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(top:30.h,left: 10.w,right: 10.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: GestureDetector(
                            onTap: (){
                              goto(context,'/rentLayout');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Rent',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                  color: w4,
                                ),),
                              height: 20.h,
                              width: 40.w,
                              color:bb ,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: GestureDetector(
                            onTap: (){
                              goto(context,'saleLayout');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Sale',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                  color: w4,
                                ),),
                              height: 20.h,
                              width: 40.w,
                              color:bb,
                            ),
                          ),
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
}
