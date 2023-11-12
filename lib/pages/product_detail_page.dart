import 'package:flutter/material.dart';
import 'package:my_app/theme_data/theme_data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../item_class/catalog.dart';

class ProductDetails extends StatelessWidget {
  final Item catalogItem;

  const ProductDetails({super.key, required this.catalogItem})
      : assert(catalogItem != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Back")),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: ButtonBar(
        buttonPadding: Vx.m8,
        alignment: MainAxisAlignment.spaceBetween,

        children: [

          "${catalogItem.price} Rs.".text.xl2.color(Colors.red[900]).bold.make(),
          ElevatedButton(onPressed:() {
            print("\$${catalogItem.name} Buy!!");
          },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
                  shape:MaterialStateProperty.all(StadiumBorder())  ),
              child: "Add To Cart".text.xl2.make()).wh(155,50)
        ],

      ).color(Colors.white),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalogItem.id.toString()),
                child: Image.network(catalogItem.image)
                    .py8()
                    .wHalf(context)
                    .centered()),
            Expanded(
              child: VxArc(
                height: 30,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      catalogItem.name.text
                          .color(MyTheme.darkBluish)
                          .xl4
                          .bold
                          .make()
                          .py(3),
                      catalogItem.desc.text.lg
                          .textStyle(context.captionStyle).center
                          .xl2
                          .make(),
                    ],
                  ).p64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
