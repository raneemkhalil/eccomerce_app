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
        "https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm34707_29637_1.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:",
  ),
  CategoryItemModel(
    id: '2',
    label: 'cheapest',
    number: 100,
    imgUrl:
        "https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm30376_29654_1_1.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:",
  )
];
