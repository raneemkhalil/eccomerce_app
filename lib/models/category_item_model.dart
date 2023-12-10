class CategoryItemModel {
  final String id;
  final String label;
  final int count;
  final String imageUrl;

  const CategoryItemModel({required this.id, required this.label, required this.count, required this.imageUrl});
}

List<CategoryItemModel> categoryItems = [
  const CategoryItemModel(id: '1', label: 'New Arrivals', count: 208, imageUrl: "https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm30508_31799_1.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795"),
  const CategoryItemModel(id: '2', label: 'New Arrivals', count: 208, imageUrl: "https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm30508_31799_1.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795")

];