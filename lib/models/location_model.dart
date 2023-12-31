class LocationModel {
  final String cityName;
  final String countryName;
  final String imgUrl;

  LocationModel(
      {required this.cityName,
      required this.countryName,
      required this.imgUrl});
}

List<LocationModel> listOfLocations = [
  LocationModel(
    cityName: "Tokyo",
    countryName: "Japan",
    imgUrl:
        'https://cdn.discordapp.com/attachments/1142438887189401732/1190758889344487515/190959.png?ex=65a2f7a2&is=659082a2&hm=c0048dad30c4568e8049cffbecebeb8897204f1b7d1eeb7fb7f59e0968f51602&',
  ),
  LocationModel(
    cityName: "New York City",
    countryName: "USA",
    imgUrl:
        'https://cdn.discordapp.com/attachments/1142438887189401732/1190758889344487515/190959.png?ex=65a2f7a2&is=659082a2&hm=c0048dad30c4568e8049cffbecebeb8897204f1b7d1eeb7fb7f59e0968f51602&',
  ),
  LocationModel(
    cityName: "London",
    countryName: "UK",
    imgUrl:
        'https://cdn.discordapp.com/attachments/1142438887189401732/1190758889344487515/190959.png?ex=65a2f7a2&is=659082a2&hm=c0048dad30c4568e8049cffbecebeb8897204f1b7d1eeb7fb7f59e0968f51602&',
  ),
];