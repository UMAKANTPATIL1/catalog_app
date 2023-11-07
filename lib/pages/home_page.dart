import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/drawer.dart';
import '../item_class/catalog.dart';
import '../widget/drawer.dart';
import '../widget/item_widget.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    var catalogJson=await rootBundle.loadString("assets/json_file/catalog.json");

    var decodedData=jsonDecode(catalogJson);
    var productData=decodedData["products"];
    //print(productData);
    CatalogModel.items=List.from(productData).map<Item>((e) => Item.fromMap(e)).toList();
    setState(() {

    });
  }
  @override

  Widget build(BuildContext context) {
    int day=20;
    String name="Learning";
    //final dummyList=List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),

        child:(CatalogModel.items!=null&&CatalogModel.items.isNotEmpty)? ListView.builder(

          itemCount:CatalogModel.items.length ,
          itemBuilder:(context, index) {
            return ItemWidget(item:CatalogModel.items[index]);
          },
        ):Center
          (
          child: CircularProgressIndicator(),

      ),
      ),
      drawer: MyDrawer(),



    );
  }
}
