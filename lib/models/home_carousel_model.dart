class HomeCarouselModel {
  final String id;
  final String imgUrl;

  HomeCarouselModel({
    required this.id,
    required this.imgUrl,
  });
}

List<HomeCarouselModel> dummyCarouselItems = [
  HomeCarouselModel(
    id: '1',
    imgUrl: 'https://media.glamourmagazine.co.uk/photos/64ba7203c24fb9a18ac297ef/16:9/w_2240,c_limit/BABY%20CLOTHES%20210723%20default-.jpg',
  ),
  HomeCarouselModel(
    id: '2',
    imgUrl: 'https://v-genius.fatafeat.com/storage/attachments/20/bigstock-Modern-living-room-with-sofa-a-169371245_848142.jpg/r/800/bigstock-Modern-living-room-with-sofa-a-169371245_848142.jpg',
  ),
  HomeCarouselModel(
    id: '3',
    imgUrl: 'https://www.summerecho.sa/wp-content/uploads/2022/12/تفسير-حلم-اجهزة-كهربائية.jpg',
  ),
  HomeCarouselModel(
    id: '4',
    imgUrl: 'https://cdn.salla.sa/form-builder/A2582EiAg3L3V6dI4Zz6JpoLnOjoePWkEFnFY32r.jpg',
  ),
];
