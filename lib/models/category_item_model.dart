class CategoryItemModel {
  final String id;
  final String label;
  final int number;
  final String imgUrl;

  CategoryItemModel(
      {required this.id,
      required this.label,
      required this.number,
      required this.imgUrl});
}

List<CategoryItemModel> listOfCategorys = [
  CategoryItemModel(
    id: '1',
    label: 'New Arrivals',
    number: 208,
    imgUrl:
        "https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm30508_31799_1.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795",
  ),
  CategoryItemModel(
    id: '2',
    label: 'New Arrivals',
    number: 208,
    imgUrl:
        "https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm30508_31799_1.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795",
  ),
  CategoryItemModel(
    id: '1',
    label: 'All',
    number: 1,
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  CategoryItemModel(
    id: '2',
    label: 'Latest',
    number: 2,
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  CategoryItemModel(
    id: '3',
    label: 'Most Popular',
    number: 3,
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  CategoryItemModel(
    id: '4',
    label: 'Cheapest',
    number: 4,
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  CategoryItemModel(
    id: '5',
    label: 'Hot',
    number: 5,
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  CategoryItemModel(
    id: '6',
    label: 'New',
    number: 6,
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
];
