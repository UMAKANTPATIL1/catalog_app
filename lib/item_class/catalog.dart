class CatalogModel{
  static final items=[
    Item(
        id:1,
        name: "Iphone 12",
        desc: "Apple iphone 12 generation.",
        price :999 ,
        color:"#ede8e6",
        image:"https://itronics.in/wp-content/uploads/2020/10/iphone12-black.png")
  ];
}



class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

   Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}
