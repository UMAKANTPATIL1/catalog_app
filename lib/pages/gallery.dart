import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Gallery"),

      ),
      body:SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              CatalogHeader(),
              if(CatalogModel.items!=null&&CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator(),),



            ],
          ),
        ),
      )


    );
  }
}
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[


        "Trending Products....".text.xl.bold.make().p(0),



      ],
    );
  }
}

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
          return CatalogItem(catalog:catalog);

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
           CatalogImage(image:catalog.image),
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
                        ElevatedButton(onPressed:() {},
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
                                shape:MaterialStateProperty.all(StadiumBorder())  ),
                            child: "Buy".text.make())
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
class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image}):assert(image!=null);

  @override
  Widget build(BuildContext context) {

    return  Image.network(image).box.roundedLg.p8.color(MyTheme.creamColor).make().py12().w40(context);
  }
}

