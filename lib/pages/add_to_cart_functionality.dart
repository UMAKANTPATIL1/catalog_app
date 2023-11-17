import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../item_class/cart.dart';
import '../item_class/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
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

      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.canvasColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart?Icon(Icons.done):Icon(CupertinoIcons.cart_fill_badge_plus),
    );
  }
}