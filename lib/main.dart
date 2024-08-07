import 'package:dar_com/getx_bindings/leading_binding.dart';
import 'package:dar_com/getx_bindings/login_binding.dart';
import 'package:dar_com/getx_bindings/profile_binding.dart';
import 'package:dar_com/getx_bindings/register_binding.dart';
import 'package:dar_com/getx_bindings/rent_layout_binding.dart';
import 'package:dar_com/getx_bindings/sale_layout_binding.dart';
import 'package:dar_com/layout/rent_lauout/rent_layout_screen.dart';
import 'package:dar_com/layout/rent_sale_layout/rent_sale_layout_screen.dart';
import 'package:dar_com/layout/sale_layout/sale_layout_screen.dart';
import 'package:dar_com/moduls/add_advertising/add_advertising_screen.dart';
import 'package:dar_com/moduls/edit_profile_user/edit_profile_user_screen.dart';
import 'package:dar_com/moduls/favorites/favorites_screen.dart';
import 'package:dar_com/moduls/login/login_screen.dart';
import 'package:dar_com/moduls/profile_user/profile_user_screen.dart';
import 'package:dar_com/moduls/register/registre_screen.dart';
import 'package:dar_com/moduls/rent_apartment_items/rent_apartement_items_screen.dart';
import 'package:dar_com/moduls/rent_home_items/rent_home_items_screen.dart';
import 'package:dar_com/moduls/rent_shop_items/rent_shop_items_screen.dart';
import 'package:dar_com/moduls/rent_villa_items/rent_villa_items_screen.dart';
import 'package:dar_com/moduls/sale_apartment_items/sale_apartment_items_screen.dart';
import 'package:dar_com/moduls/sale_home_items/sale_home_items_screen.dart';
import 'package:dar_com/moduls/sale_shop_items/sale_shop_items_screen.dart';
import 'package:dar_com/moduls/sale_villa_items/sale_villa_items_screen.dart';
import 'package:dar_com/moduls/search/search_screen.dart';
import 'package:dar_com/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'moduls/leading/leading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                dividerColor: b2,
              ),
              initialRoute:'/leading',
          getPages: [
            GetPage(name: '/leading', page: ()=> LeadingScreen(),binding: LeadingBinding()),
            GetPage(name: '/rentLayout', page: ()=> RentLayoutScreen(),bindings: [RentLayoutBinding(), LoginBinding()]),
            GetPage(name: '/saleLayout', page: ()=> SaleLayoutScreen(),bindings: [SaleLayoutBinding(),LoginBinding()]),
            GetPage(name: '/rentSaleLayout', page: ()=> RentSaleScreen()),
            GetPage(name: '/addAdvertising', page: ()=> AddAdvertisingScreen()),
            GetPage(name: '/editProfile', page: ()=> EditProfileUserScreen()),
            GetPage(name: '/favorites', page: ()=> FavoritesScreen()),
            GetPage(name: '/login', page: ()=> LoginScreen(),binding: LoginBinding()),
            GetPage(name: '/register', page: ()=> RegisterScreen(),binding: RegisterBinding()),
            GetPage(name: '/profile', page: ()=> ProfileUserScreen(),binding: ProfileBinding()),
            GetPage(name: '/rentApartment', page: ()=> RentApartmentItemsScreen()),
            GetPage(name: '/rentHome', page: ()=> RentHomeItemsScreen()),
            GetPage(name: '/rentShop', page: ()=> RentShopItemsScreen()),
            GetPage(name: '/rentVilla', page: ()=> RentVillaItemsScreen()),
            GetPage(name: '/saleApartment', page: ()=> SaleApartmentItemsScreen()),
            GetPage(name: '/saleHome', page: ()=> SaleHomeItemsScreen()),
            GetPage(name: '/saleShop', page: ()=> SaleShopItemsScreen()),
            GetPage(name: '/saleVilla', page: ()=> SaleVillaItemsScreen()),
            GetPage(name: '/search', page: ()=> SearchScreen()),
          ],
          builder: EasyLoading.init(),
            ));
  }
}
