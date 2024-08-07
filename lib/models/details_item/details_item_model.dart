class DetailItemModel{
  late final List<String> urlImages;
  late final String info;
  late final String location;
  late final int numRooms;
  late final double size;
  late final double price;
  late final int numPathRooms;
  late final double dimensionOfSchool;
  late final double dimensionOfCity;
  late final bool   netSubscription;
  late final bool   phoneSubscription;

  DetailItemModel({
    required this.urlImages,
    required this.info,
    required this.location,
    required this.numRooms,
    required this.size,
    required this.price,
    required this.dimensionOfCity,
    required this.dimensionOfSchool,
    required this.numPathRooms,
    required this.netSubscription,
    required this.phoneSubscription,
});
}