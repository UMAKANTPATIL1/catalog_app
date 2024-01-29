import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/cart_store/cart.dart';
import 'package:my_app/cart_store/manupulate_data_store.dart';
import 'package:my_app/navigate_pages/navigate.dart';
import 'package:my_app/pages/productlist_ui_pages/catalog_header.dart';
import 'package:my_app/pages/productlist_ui_pages/catalogl_list.dart';
import 'package:my_app/theme_data/theme_data.dart';
import 'package:my_app/widget/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../item_class/catalog.dart';
import '../widget/item_widget.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({super.key});

  @override
  State<MyGallery> createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson =
        await rootBundle.loadString("assets/json_file/catalog.json");

    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    //print(productData);
    CatalogModel.items =
        List.from(productData).map<Item>((e) => Item.fromMap(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: Text("Catalog App"),
        backgroundColor: Colors.transparent,
      ),
      drawer: MyDrawer(),
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, status, _) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartPage);
          },
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          backgroundColor: context.theme.buttonColor,
        ).badge(
          color: Vx.red600,
          size: 22,
          count: _cart.items.length,
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
