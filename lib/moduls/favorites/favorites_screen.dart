import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/styles/colors.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
       backgroundColor: bb,
       title:Text('Your Favorites Property',
       style: TextStyle(
         fontSize: 15.sp,
       ),),
        bottom: TabBar(
          indicatorColor: w4,
          controller: controller,
          tabs: const [
            Tab(text: 'Rent Property',),
            Tab(text: 'Sale Property',),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          ListView.separated(
            itemBuilder: ( context,index){
              return Container();
            },
            separatorBuilder: (context,index){
              return SizedBox(height: 3.h,);
            },
            itemCount: 0),
          ListView.separated(
            itemBuilder: ( context,index){
              return Container();
            },
            separatorBuilder: (context,index){
              return SizedBox(height: 3.h,);
            },
            itemCount: 0),
      ],),
    );
  }
}
