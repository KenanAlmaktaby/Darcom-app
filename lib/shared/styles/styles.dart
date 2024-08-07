import 'dart:io';

import 'package:dar_com/controller/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../components/components.dart';
import 'colors.dart';


// Button Widget
class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        primary: bb,
        onPrimary: w4,
        maximumSize: Size(100.w, 20.h),
        shadowColor: lbb,
        elevation: 10,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
      ),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}

//class Numbers Widget for profile screen
class NumbersWidget extends StatelessWidget {
  final int numPropertySale;
  final int numPropertyRent;
  final int numSoldProperties;
  final int numRentalProperties;

  const NumbersWidget({
    Key? key,
    required this.numPropertySale,
    required this.numPropertyRent,
    required this.numSoldProperties,
    required this.numRentalProperties,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic text = [
      'Properties that you have Sold',
      'Properties that you have Rented',
      'Properties you have bought',
      'Properties you have Rented',
    ];
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInfoNumbers(context, numPropertySale, text[0]),
              buildDivider(context),
              buildInfoNumbers(context, numPropertyRent, text[1]),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInfoNumbers(context, numSoldProperties, text[2]),
              buildDivider(context),
              buildInfoNumbers(context, numRentalProperties, text[3]),
            ],
          ),
        ),
      ],
    );
  }
}

//class  Data for PieData's data for get sections function
class Data {
  final String name;

  final double percent;
  final Color colorSec;

  Data({
    required this.name,
    required this.percent,
    required this.colorSec,
  });
}

//class PieData's Data for get sections function
class PieData {
  final double? p1;
  final double? p2;
  final double? p3;
  final double? p4;

  PieData({
    this.p1 = 0,
    this.p2 = 0,
    this.p3 = 0,
    this.p4 = 0,
  });

  dynamic text = [
    'Properties that you have Sold',
    'Properties that you have Rented',
    'Properties you have bought',
    'Properties you have Rented',
  ];

  List<Data> getListSections() {
    List<Data> data = [
      Data(name: text[0], percent: p1!, colorSec: blue),
      Data(name: text[1], percent: p2!, colorSec: green),
      Data(name: text[2], percent: p3!, colorSec: n),
      Data(name: text[3], percent: p4!, colorSec: orangel),
    ];
    return data;
  }
}

//class IndicatorWidget for Profile
class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PieData pp = PieData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: pp
          .getListSections()
          .map((data) =>
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: buildIndicator(context,
                text: data.name, color: data.colorSec),
          ))
          .toList(),
    );
  }
}

//class TextFiled for Screens
class TextFiledWidget extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFiledWidget({
    Key? key,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<TextFiledWidget> createState() => _TextFiledWidgetState();
}

class _TextFiledWidgetState extends State<TextFiledWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: bb,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
              ),
            ),
          ),
        ],
      );
}

class SearchWidget extends StatefulWidget {
  final String text;
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle styleActive = TextStyle(color: bb);
    TextStyle styleHint = TextStyle(color: lbb);
    TextStyle style = widget.text.isEmpty ? styleHint : styleActive;
    return Container(
      height: 6.h,
      margin: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: w4,
        border: Border.all(color: bb),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search_rounded,
            color: style.color,
          ),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
            child: Icon(
              Icons.close,
              color: style.color,
            ),
            onTap: () {
              controller.clear();
              widget.onChanged('');
              FocusScope.of(context).requestFocus(FocusScopeNode());
            },
          )
              : null,
          hintText: widget.hintText,
          hintStyle: styleHint,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
