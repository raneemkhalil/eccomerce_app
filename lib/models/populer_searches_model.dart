enum Type{
  // ignore: constant_identifier_names
  Hot, New, Populer 
}

class PopulerSearchedItem {
  final String imgUrl;
  final String title;
  final String description;
  final Type? type;

  PopulerSearchedItem({required this.imgUrl, required this.title, required this.description, this.type});

  PopulerSearchedItem copyWith({
    String? imgUrl,
    String? title,
    String? description,
    Type? type,
  }) {
    return PopulerSearchedItem(
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type
    );
  }
}

List<PopulerSearchedItem> listPopulerSearch = [
  PopulerSearchedItem(
    imgUrl: 'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm23525_29623_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    title: 'Lunilo Hels Jacket',
    description: "1,6k Search today",
    type: Type.Hot
  ),
  PopulerSearchedItem(
    imgUrl: 'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm31151_10729_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    title: 'Denim Jeans',
    description: "1k Search today",
    type: Type.New
  ),
  PopulerSearchedItem(
    imgUrl: 'https://www.seasaltcornwall.com/media/catalog/product/b/-/b-wm21498-14255_replace_2_22.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    title: 'Redil Backpack',
    description: "1,23k Search today",
    type: Type.Populer
  ),
  PopulerSearchedItem(
    imgUrl: 'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm31098_29875_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    title: 'JBL Speakers',
    description: "1,1k Search today",
    type: Type.New
  ),
];