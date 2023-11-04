import 'package:flutter/material.dart';
import '../widget/drawer.dart';
import '../item_class/catalog.dart';
import '../widget/drawer.dart';
import '../widget/item_widget.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int day=20;
    String name="Learning";
    final dummyList=List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),

        child: ListView.builder(

          itemCount:dummyList.length ,
          itemBuilder:(context, index) {
            return ItemWidget(item:dummyList[index]);
          },
        ),
      ),
      drawer: MyDrawer(),



    );
  }
}
