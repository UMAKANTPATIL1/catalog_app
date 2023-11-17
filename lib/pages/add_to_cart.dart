import 'package:flutter/material.dart';
import 'package:my_app/item_class/cart.dart';
import 'package:my_app/item_class/catalog.dart';
import 'package:my_app/theme_data/theme_data.dart';
import 'package:velocity_x/velocity_x.dart';
class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: "Cart".text.make(),backgroundColor: context.canvasColor,
      ),
    body: Column(
      children: [
        _CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ],
    ),
    );
  }
}
class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart=CartModel();
    CatalogModel catolg;


    return SizedBox(
      height: 200,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [


          "\INR.${_cart.totalPrice}".text.xl2.make(),
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying Not Supported Yet.".text.make()));
              },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
            ),
              child: "Buy".text.make(),
              ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  final _cart=CartModel();
  Widget build(BuildContext context) {

    return _cart.items.isEmpty
        ? "Cart Is Empty...".text.xl2.makeCentered()
        : ListView.builder(
        itemCount: _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.done,color: Colors.green,),
      trailing: IconButton(icon:Icon(Icons.remove_circle_outline_rounded,color: Colors.redAccent,),
        onPressed:() {
        _cart.remove(_cart.items[index]);
        setState(() {
        });
        },
      ),
      title: _cart.items[index].name.text.make(),
    ),
    );

  }
}

