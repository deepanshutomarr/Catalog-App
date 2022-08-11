class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});

}

final products = [
  Item(
      id: "Codepur001",
      name: "Apple iPhone 13 Pro MAX",
      desc: "Apple iPhone 13th generation",
      price: 99999,
      color: "#33505a",
      image: "https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iphone13_colors_09142021_big.jpg.large.jpg",
  )
]