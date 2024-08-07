import 'package:dar_com/controller/sale_layout/sale_layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/login/login_controller.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class SaleLayoutScreen extends StatelessWidget {
  SaleLayoutController saleLayoutController = Get.find();
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: w4,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: bb,
            expandedHeight: 40.h,
            floating: false,
            pinned: true,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  goto(context, '/search');
                },
                icon: Icon(
                  Icons.search_rounded,
                  size: 20.sp,
                  color: w4,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '   Sale Property ',
                style: TextStyle(
                  color: w4,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        goto(context, '/saleVilla');
                      },
                      child: SizedBox(
                        height: 30.h,
                        width: double.infinity.w,
                        child: Image.asset(
                          'assets/images/villa.jpg',
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.colorBurn,
                          color: b1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(20),
                    color: w4.withOpacity(0.30),
                    alignment: AlignmentDirectional.center,
                    width: double.infinity.w,
                    child: Text(
                      'Villas',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        letterSpacing: 20.sp,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: b2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        goto(context, '/saleHome');
                      },
                      child: SizedBox(
                        height: 30.h,
                        width: double.infinity.w,
                        child: Image.asset(
                          'assets/images/homes1.jpg',
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.colorBurn,
                          color: b1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(20),
                    color: w4.withOpacity(0.30),
                    alignment: AlignmentDirectional.center,
                    width: double.infinity.w,
                    child: Text(
                      'Homes',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        letterSpacing: 20.sp,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: b2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        goto(context, '/saleApartment');
                      },
                      child: SizedBox(
                        height: 30.h,
                        width: double.infinity.w,
                        child: Image.asset(
                          'assets/images/apartments.jpg',
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.colorBurn,
                          color: b1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(20),
                    color: w4.withOpacity(0.30),
                    alignment: AlignmentDirectional.center,
                    width: double.infinity.w,
                    child: Text(
                      'Apartments',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        letterSpacing: 15.sp,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: b2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        goto(context, '/saleShop');
                      },
                      child: SizedBox(
                        height: 30.h,
                        width: double.infinity.w,
                        child: Image.asset(
                          'assets/images/shops.jpg',
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.colorBurn,
                          color: b1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(20),
                    color: w4.withOpacity(0.30),
                    alignment: AlignmentDirectional.center,
                    width: double.infinity.w,
                    child: Text(
                      'Shops',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        letterSpacing: 15.sp,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: b2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).padding.top),
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Obx(
                    () =>
                        saleLayoutController.checkTokenIsValid.value == true ||
                                loginController.isGo.value == true
                            ? Text(
                                'Hello! ${loginController.name}',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: or3,
                                ),
                              )
                            : Container(),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: double.infinity.w,
                    height: 0.1.h,
                    color: gray,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Obx(
                    () => Container(
                      padding: EdgeInsets.all(15.sp),
                      child: saleLayoutController.checkTokenIsValid.value ==
                                  true ||
                              loginController.isGo.value == true
                          ? Wrap(
                              runSpacing: 2.h,
                              children: [
                                ListTile(
                                  title: const Text('Profile'),
                                  leading: Icon(Icons.account_circle_outlined),
                                  onTap: () {
                                    goto(context, '/profile');
                                  },
                                ),
                                ListTile(
                                  title: const Text('Favorites'),
                                  leading: Icon(Icons.favorite_border),
                                  onTap: () {
                                    goto(context, '/favorites');
                                  },
                                ),
                                ListTile(
                                  title: const Text('Your Advertising'),
                                  leading: Icon(Icons.campaign_outlined),
                                  onTap: () {
                                    goto(context, '/addAdvertising');
                                  },
                                ),
                                ListTile(
                                  title: Text('Logout'),
                                  leading: Icon(Icons.logout),
                                  onTap: () {},
                                ),
                              ],
                            )
                          : Wrap(
                              runSpacing: 2.h,
                              children: [
                                ListTile(
                                  title: Text('Login'),
                                  leading: Icon(Icons.login),
                                  onTap: () {
                                    Navigator.pop(context);
                                    goto(context, '/login');
                                  },
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
