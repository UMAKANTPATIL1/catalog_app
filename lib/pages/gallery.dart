import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/widget/drawer.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Gallery"),

      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),

        child:(CatalogModel.items!=null&&CatalogModel.items.isNotEmpty)?GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing:7 ),

          itemBuilder: ( context,  index) {
              final item=CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: GridTile(
                      header: Text(item.name, style: TextStyle(
                        fontWeight: FontWeight.bold,

                      ),
                      ),
                      child: Image.network(item.image),
                      footer: Text(item.price.toString(),style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  )
              );

          },
          itemCount: CatalogModel.items.length,

        )

            :Center
          (
          child: CircularProgressIndicator(),

        ),
      ),
      drawer: MyDrawer(),

    );
  }
}
