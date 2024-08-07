import 'package:get/get.dart';
import '../../utils/details_item_preferences.dart';

class SearchCostumController extends GetxController{
  late RxList itemP=[].obs;
  RxString query = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    itemP.value = DetailsItemPreferences().item;
  }

  void reset(query,itemP){
    this.query.value = query;
    this.itemP.value = itemP;
  }
}