
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../../utils/details_item_preferences.dart';
import 'package:dar_com/controller/search/search_controller.dart';

class SearchScreen extends StatelessWidget {

  SearchCostumController  searchController=Get.put(SearchCostumController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bb,
      ),
      body: Column(
        children: [
          Obx(() => buildSearch()),
          Expanded(
            child: Obx(()=>ListView.separated(
                padding: EdgeInsets.all(20.sp),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 3.h,
                  );
                },
                itemCount: searchController.itemP.value.length,
                itemBuilder: (context, index) {
                  final item = searchController.itemP.value[index];
                  return buildProperityItem(context, index, item.urlImages[0],
                      item.location, item.size, item.numRooms, item);
                }),),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return SearchWidget(
      text: searchController.query.value,
      hintText: ' location name or number of rooms..',
      onChanged: searchItemProperty,
    );
  }

  void searchItemProperty(String query) {
    final itemP = DetailsItemPreferences().item.where((item) {
      final titleLower = item.location.toLowerCase();
      final number = item.numRooms.toString();
      final size = item.size.toString();
      final serchLower = query.toLowerCase();

      return titleLower.contains(serchLower) || number.contains(serchLower) ||size.contains(serchLower);
    }).toList();
    searchController.reset(query, itemP);
  }
}
