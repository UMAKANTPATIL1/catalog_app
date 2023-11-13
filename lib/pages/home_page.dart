import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          title: Text("Catalog App"),
          backgroundColor: Colors.transparent,
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(onPressed: (){},
          child:Icon(CupertinoIcons.cart,color: Colors.white,),backgroundColor: context.theme.buttonColor,),

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
