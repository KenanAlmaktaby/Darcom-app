
import 'package:dar_com/models/details_item/details_item_model.dart';
import 'package:dar_com/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../shared/styles/colors.dart';

class DetailItemScreen extends StatelessWidget {
  final DetailItemModel item;

  const DetailItemScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final phoneNumber='+963991525087';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context, 'Details of Property'),
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: item.urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final image = item.urlImages[index];
                    return buildSlideImages(context, image, index);
                  },
                  options: CarouselOptions(
                    height: 30.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'About Property:',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7.sp),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    item.info,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Location:',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' ${item.location}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: or3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.roofing_sharp,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Number of Rooms:',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' ${item.numRooms}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: or3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.space_dashboard_outlined,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Size of Property:',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' ${item.size} m^2',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: or3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.monetization_on_outlined,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Price of Property:',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' ${item.price}\$',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: or3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.bathroom_outlined,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Number of Path Rooms of Property:',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' ${item.numPathRooms}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: or3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.school_outlined,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Dimension Property of School:',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' ${item.dimensionOfSchool} KM^2',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: or3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_city_outlined,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Dimension Property of City:',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' ${item.dimensionOfCity} KM^2',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: or3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Phone Subscription:',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: item.phoneSubscription?Colors.green:Colors.red,
                      radius: 5.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.network_check_outlined,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Network Subscription:',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: item.netSubscription?Colors.green:Colors.red,
                      radius: 5.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                buildButton(context, 'For Contact', () {
                  _showModalBottomSheet(context);
                }),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 30.h,
            color: w4,
            child: Padding(
              padding: EdgeInsets.all(30.sp),
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      buildCircle(
                          child: IconButton(
                              onPressed: () async{
                                final _call='tel:$phoneNumber';
                                if(await canLaunchUrlString(_call)){
                                  await launchUrlString(_call);
                                }
                              },
                              icon: Icon(
                                Icons.phone_outlined,
                                size: 25.sp,
                                color: w4,
                              )),
                          all: 15.sp,
                          color: bb
                      ),
                      SizedBox(height: 1.h,),
                      Text('Call',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: bb,
                        fontWeight: FontWeight.bold,
                      ),)
                    ]),
                  ),
                  SizedBox(width: 4.w,),
                  Expanded(
                    child: Column(children: [
                      buildCircle(
                          child: IconButton(
                              onPressed: ()async {
                                final _message='sms:$phoneNumber';
                                if (await canLaunchUrlString(_message)) {
                                  await launchUrlString(_message);
                                }
                              },
                              icon: Icon(
                                Icons.message_outlined,
                                size: 25.sp,
                                color: w4,
                              )),
                          all: 15.sp,
                          color: bb
                      ),
                      SizedBox(height: 1.h,),
                      Text('SMS',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: bb,
                        fontWeight: FontWeight.bold,
                      ),)
                    ]),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
