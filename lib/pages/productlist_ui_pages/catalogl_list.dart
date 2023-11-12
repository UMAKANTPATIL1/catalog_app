import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/navigate_pages/navigate.dart';
import 'package:my_app/pages/product_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../item_class/catalog.dart';
import '../../theme_data/theme_data.dart';
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

  const CatalogItem({super.key, required this.catalog}) :assert(catalog!=null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(tag:Key(catalog.id.toString()),child: CatalogImage(image:catalog.image)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  catalog.name.text.color(MyTheme.darkBluish).xl.bold.make(),
                  catalog.desc.text.lg.textStyle(context.captionStyle).make(),
                  ButtonBar(
                    buttonPadding: Vx.m8,
                    alignment: MainAxisAlignment.spaceBetween,

                    children: [

                      "${catalog.price} Rs.".text.lg.bold.make(),
                      ElevatedButton(onPressed:() {
                        print("\$${catalog.name} Buy!!");
                        Navigator.pushNamed(context, MyRoutes.cartPage);
                      },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
                              shape:MaterialStateProperty.all(StadiumBorder())  ),
                          child: "Add To Cart".text.make())
                    ],

                  )


                ],
              ),
            ),
          ],

        )


    ).white.rounded.square(150).make().py12();
  }

}

