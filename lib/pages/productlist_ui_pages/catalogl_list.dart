import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/item_class/cart.dart';
import 'package:my_app/navigate_pages/navigate.dart';
import 'package:my_app/pages/product_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../item_class/catalog.dart';
import '../../theme_data/theme_data.dart';
import '../add_to_cart_functionality.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index)
      {
        final catalog=CatalogModel.items[index];
        return InkWell(
          child: CatalogItem(catalog:catalog),
          onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(catalogItem: catalog),))
          },
        );

      },
    );

  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      :assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(

        child: Row(
          children: [
            Hero(tag: Key(catalog.id.toString()),
                child: CatalogImage(image: catalog.image)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  catalog.name.text
                      .color(context.accentColor)
                      .size(15)
                      .bold
                      .make()
                      .px(4)
                      .p(5),
                  catalog.desc.text.textStyle(context.captionStyle).make().px(8)
                  ,
                  ButtonBar(
                    buttonPadding: Vx.mH4,
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [

                      "${catalog.price}Rs".text.lg.bold.make(),
                      AddToCart(catalog: catalog),
                    ],


                  ),


                ],
              ).px(1),
            ),
          ],

        )


    )
        .color(context.cardColor)
        .rounded
        .square(150)
        .make()
        .py12();
  }

}

