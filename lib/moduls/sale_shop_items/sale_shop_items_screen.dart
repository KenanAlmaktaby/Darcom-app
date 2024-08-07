import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/details_item/details_item_model.dart';
import '../../shared/components/components.dart';
import '../../utils/details_item_preferences.dart';

class SaleShopItemsScreen extends StatefulWidget {
  const SaleShopItemsScreen({Key? key}) : super(key: key);

  @override
  State<SaleShopItemsScreen> createState() => _SaleShopItemsScreenState();
}

class _SaleShopItemsScreenState extends State<SaleShopItemsScreen> {
  List<DetailItemModel> itemP = DetailsItemPreferences().item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Shop\'s Properties'),
      body: ListView.separated(
          padding: EdgeInsets.all(20.sp),
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 5.h,
            );
          },
          itemCount: itemP.length,
          itemBuilder: (context, index) {
            final item = itemP[index];
            return buildProperityItem(context, index, item.urlImages[0],
                item.location, item.size, item.numRooms, item);
          }),
    );
  }
}
