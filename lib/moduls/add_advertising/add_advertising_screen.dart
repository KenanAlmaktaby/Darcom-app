import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dar_com/shared/components/components.dart';
import 'package:dar_com/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../shared/styles/colors.dart';

class AddAdvertisingScreen extends StatefulWidget {
  const AddAdvertisingScreen({Key? key}) : super(key: key);

  @override
  State<AddAdvertisingScreen> createState() => _AddAdvertisingScreenState();
}

class _AddAdvertisingScreenState extends State<AddAdvertisingScreen> {
  bool press = false;
  bool isSelected = false;
  bool check1=false;
  bool check2=false;

  final _picker = ImagePicker();
  List<XFile>? imageFileList = [];

  Future<void> selectedImage() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
            color: bb,
          ));
        });
    final List<XFile>? selectedImage = await _picker.pickMultiImage();
    if (selectedImage!.isNotEmpty) {
      imageFileList!.addAll(selectedImage);
      setState(() {
        isSelected = true;
      });
    }
    Navigator.of(context).pop();
    print(' length: ${imageFileList!.length.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Add Advertising '),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                child: Row(
                  children: [
                    Text(
                      'Add your Property Images:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          selectedImage();
                        },
                        icon: Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 15.sp,
                          color: bb,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              isSelected
                  ? Center(
                      child: CarouselSlider.builder(
                        itemCount: imageFileList!.length,
                        itemBuilder: (context, index, realIndex) {
                          final image = Image.file(
                            File(imageFileList![index].path),
                            fit: BoxFit.cover,
                          );
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            color: gray,
                            child: image,
                          );
                        },
                        options: CarouselOptions(
                          height: 30.h,
                          autoPlay: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          // enlargeCenterPage: true,
                        ),
                      ),
                    )
                  : Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'No Images Selected Yet...',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: or3,
                        ),
                      ),
                    ),
              SizedBox(
                height: 3.h,
              ),
              TextFiledWidget(
                  label: 'About:',
                  text: 'Yor Property\'s details..',
                  onChanged: (about) {}),
              SizedBox(
                height: 3.h,
              ),
              TextFiledWidget(
                  label: 'Location:',
                  text: 'for example Korea',
                  onChanged: (location) {}),
              SizedBox(
                height: 3.h,
              ),
              TextFiledWidget(
                  label: 'Number of Rooms:',
                  text: 'for example 5',
                  onChanged: (nRoom) {}),
              SizedBox(
                height: 3.h,
              ),
              TextFiledWidget(
                  label: 'Size:',
                  text: 'for example 145',
                  onChanged: (size) {}),
              SizedBox(
                height: 3.h,
              ),
              TextFiledWidget(
                  label: 'Price',
                  text: 'for example 1000',
                  onChanged: (price) {}),
              SizedBox(
                height: 3.h,
              ),
              TextFiledWidget(
                  label: 'Number of Path Rooms:',
                  text: 'for example 2',
                  onChanged: (numPath) {}),
              SizedBox(
                height: 3.h,
              ),
              TextFiledWidget(
                  label: 'Dimension of School:',
                  text: 'for example 120 Km^2',
                  onChanged: (dimension) {}),
              SizedBox(
                height: 3.h,
              ),
              TextFiledWidget(
                  label: 'Dimension of City:',
                  text: 'for example 40 Km^2',
                  onChanged: (dimension) {}),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Text('Phone Subscription:'),
                  SizedBox(width: 1.w,),
                  Checkbox(value: check1, activeColor: bb,onChanged: (check){
                   setState((){
                     this.check1=check!;
                   });
                  }),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Text('Net Subscription:     '),
                  SizedBox(width: 1.w,),
                  Checkbox(value: check2,activeColor: bb, onChanged: (check){
                    setState((){
                      this.check2=check!;
                    });
                  }),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          press= !press;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: press? or3 : gray,
                        ),
                        child: Text(
                          'Rent',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          press = !press;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: press ?gray:or3,
                        ),
                        child: Text(
                          'Sale',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              buildButton(context, 'Add Property', () {}),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
