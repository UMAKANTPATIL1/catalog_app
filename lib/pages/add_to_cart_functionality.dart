import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/cart_store/manupulate_data_store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../cart_store/cart.dart';
import '../item_class/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});

  @override

  @override
  Widget build(BuildContext context) {

   final CartModel _cart=(VxState.store as MyStore).cart;
   //final CatalogModel _catalog=(VxState.store as MyStore).catalog;

   VxState.watch(context, on: [AddMutation,RemoveMutation]);
    bool isInCart=_cart.items.contains(catalog)??false;

    return ElevatedButton(


      onPressed: () {
        if(!isInCart) {
          // isInCart = isInCart.toggle();
          // final _catalog = CatalogModel();

          // _cart.catalog = _catalog;
          AddMutation(catalog);
          //_cart.add(catalog);
          // setState(() {});
        }
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:"Product added in cart successfully...".text.makeCentered()));
        // Navigator.pushNamed(context, MyRoutes.cartPage);
      },

      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart?Icon(Icons.done):Icon(CupertinoIcons.cart_fill_badge_plus),
    );
  }
}