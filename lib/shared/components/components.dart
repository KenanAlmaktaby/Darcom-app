import 'package:dar_com/models/details_item/details_item_model.dart';
import 'package:dar_com/moduls/details_item/details_Item_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';

//for AppBar Profile
AppBar buildAppBar(BuildContext context, title) {
  return AppBar(
    leading: BackButton(
      color: bb,
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(title,
    style: TextStyle(
      color: b2,
    ),),
  );
}

// build Edit icon
Widget buildEditIcon(
        BuildContext context, Color color, Color outCirculColor) =>
    buildCircle(
      color: outCirculColor,
      all: 3.sp,
      child: buildCircle(
        child: Icon( Icons.edit,
          color: w4,
          size: 16.sp,
        ),
        color: color,
        all: 6.sp,
      ),
    );

//build camera Icon for select image in profile Widget
Widget buildCameraIcon(
    BuildContext context, Color color, Color outCirculColor) =>
    buildCircle(
      color: outCirculColor,
      all: 3.sp,
      child: buildCircle(
        child: Icon(Icons.add_a_photo ,
          color: w4,
          size: 16.sp,
        ),
        color: color,
        all: 6.sp,
      ),
    );
//build function for make his child around with circle
Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );

//build Name for profile
Widget buildName(BuildContext context, userName, userEmail) => Column(
      children: [
        Text(
          userName,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          userEmail,
          style: TextStyle(
            fontSize: 10.sp,
            color: lbb,
          ),
        ),
      ],
    );

//build button for screens
Widget buildButton(BuildContext context, String text, function) => ButtonWidget(
      text: text,
      onClicked: function,
    );
//build information of numbers of properties for user
Widget buildInfoNumbers(BuildContext context, int number, String text) =>
    Padding(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$number',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: or3,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            width: 20.w,
            child: Center(
              child: Text(
                text,
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );

//build divider
Widget buildDivider(BuildContext context) =>
    Container(height: 10.h, child: VerticalDivider());

//List of pieChart sections for profile screen
List<PieChartSectionData> getSections(
   BuildContext context, NPS, NPR, NSP, NRP) {
  int sum = NPS + NPR + NSP + NRP;
  double p1 = ((NPS / (sum)) * 100);
  double p2 = ((NPR / (sum)) * 100);
  double p3 = ((NSP / (sum)) * 100);
  double p4 = ((NRP / (sum)) * 100);
  PieData pp = PieData(p1: p1, p2: p2, p3: p3, p4: p4);
  return pp
      .getListSections()
      .asMap()
      .map<int, PieChartSectionData>((index, data) {
        final value = PieChartSectionData(
            color: data.colorSec,
            title: '${data.percent.round()}%',
            value: data.percent,
            radius: 12.w,
            titleStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: w4,
            ));
        return MapEntry(index, value);
      })
      .values
      .toList();
}

//function buildIndicator for IndicatorWidget
Widget buildIndicator(
  BuildContext context, {
  @required color,
  @required text,
  bool isSquare = false,
  double size = 5,
  Color textColor = Colors.black,
}) =>
    Row(
      children: [
        Container(
          height: size.h,
          width: size.w,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 10.sp,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

// function for property Item in list
Widget buildProperityItem( BuildContext context,int index, String urlImag,String location,
    double size,int numRoom,DetailItemModel item){
  return Padding(
    padding: EdgeInsets.all(5.sp),
    child: Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.sp),
          child: GestureDetector(
            onTap: (){
              Get.to(()=> DetailItemScreen(item:item));
            },
            child: Container(
              child: Image.asset(urlImag,
              fit: BoxFit.cover,
                colorBlendMode: BlendMode.colorBurn,
                color: b1,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.only(top: 2.h,bottom: 2.h,start: 2.w),
          width: double.infinity.w,
          color: w4.withOpacity(0.3),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                    color: b3,
                    size: 20.sp,),
                  SizedBox(width: 2.w,),
                  Text(location,
                      style:TextStyle(
                        color: b3,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.space_dashboard_outlined,
                    color: b3,
                    size: 15.sp,),
                  Text('${size.toString()}, ',
                      style:TextStyle(
                        color: b3,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(width: 2.w,),
                  Icon(Icons.roofing_sharp,
                    color: b3,
                    size: 15.sp,),
                  Text(numRoom.toString(),
                      style:TextStyle(
                        color: b3,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//function for slide images in property detail screen
Widget buildSlideImages(BuildContext context,String urlimg,int index)=>Container(
  margin: EdgeInsets.symmetric(horizontal:3.w),
  color: gray,
  child: Image.asset(urlimg,
    fit: BoxFit.cover,
  ),
);


// function for navigation from screen to an other
void goto(context, dynamic S,) {
  Get.toNamed(S);
}
