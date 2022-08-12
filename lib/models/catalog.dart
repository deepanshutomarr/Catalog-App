class CatalogModel {
  static final Items = [
    Item(
      id: 1,
      name: "iPhone 13 Pro",
      desc: "Apple iPhone 13th generation",
      price: 105999,
      color: "#33505a",
      image:
          "https://m.media-amazon.com/images/I/61i8Vjb17SL._SL1500_.jpg",
    )
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}
