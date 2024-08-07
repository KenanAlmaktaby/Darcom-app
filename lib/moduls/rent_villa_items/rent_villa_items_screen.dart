import 'package:dar_com/models/details_item/details_item_model.dart';
import 'package:dar_com/shared/components/components.dart';
import 'package:dar_com/utils/details_item_preferences.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/styles/colors.dart';

class RentVillaItemsScreen extends StatefulWidget {
  const RentVillaItemsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RentVillaItemsScreen> createState() => _RentVillaItemsScreenState();
}

class _RentVillaItemsScreenState extends State<RentVillaItemsScreen> {
  @override
  Widget build(BuildContext context) {
    List<DetailItemModel> itemP = DetailsItemPreferences().item;
    return Scaffold(
      appBar: buildAppBar(context, 'Villa\'s Properties'),
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
