import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/item_class/cart.dart';
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

                  catalog.name.text.color(context.accentColor).size(15).bold.make().px(4).p(5),
                  catalog.desc.text.textStyle(context.captionStyle).make().px(8)
                  ,
                  ButtonBar(
                    buttonPadding: Vx.mH4,
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [

                      "${catalog.price}Rs".text.lg.bold.make(),
                      _AddToCart(catalog: catalog),
                ],



                  ),


                ],
              ).px(1),
            ),
          ],

        )


    ).color(context.cardColor).rounded.square(150).make().py12();
  }

}
class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({super.key, required this.catalog});

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  @override
  Widget build(BuildContext context) {
    final _cart= CartModel();
    bool isInCart=_cart.items.contains(widget.catalog)??false;
    return ElevatedButton(

            onPressed: () {
              if(!isInCart) {
                isInCart = isInCart.toggle();

                print(isInCart);
                final _catalog = CatalogModel();

                _cart.catalog = _catalog;
                _cart.add(widget.catalog);
                setState(() {

                });
              }

             // Navigator.pushNamed(context, MyRoutes.cartPage);
            },
            child: isInCart?Icon(Icons.done):Icon(CupertinoIcons.cart_fill_badge_plus),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(

                    context.theme.hoverColor),

                shape: MaterialStateProperty.all(StadiumBorder())),

    );
  }
}

