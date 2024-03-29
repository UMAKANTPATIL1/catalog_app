import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/theme_data/theme_data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../item_class/catalog.dart';
import 'add_to_cart_functionality.dart';

class ProductDetails extends StatelessWidget {
  final Item catalogItem;

  const ProductDetails({super.key, required this.catalogItem})
      : assert(catalogItem != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: context.canvasColor,),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: ButtonBar(
        buttonPadding: Vx.mH24,
        alignment: MainAxisAlignment.spaceBetween,

        children: [

          "${catalogItem.price} Rs.".text.xl2.color(context.accentColor).bold.make().px8(),
          AddToCart(catalog: catalogItem),
          // ElevatedButton(onPressed:() {
          //   print("\$${catalogItem.name} Buy!!");
          // },
          //
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all(context.canvasColor),
          //         shape: MaterialStateProperty.all(StadiumBorder())),
          //     child: AddToCart(catalog: catalogItem,)) ,

        ],

      ).color(context.cardColor),
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
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      catalogItem.name.text
                          .color(context.accentColor)
                          .xl2
                          .bold
                          .make()
                          .p(7),
                      catalogItem.desc.text.lg
                          .textStyle(context.captionStyle).center
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
