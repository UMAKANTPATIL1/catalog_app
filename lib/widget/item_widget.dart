import 'package:flutter/material.dart';

import '../item_class/catalog.dart';
class ItemWidget extends StatelessWidget {
final Item item;
  const ItemWidget({ super.key,required this.item})
      :assert(item!=null);


  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(

        onTap: () {
          print("\$${item.name} preserd");
        },

        leading: Image.network(item.image,width: 80,height: 80,fit: BoxFit.cover),
       tileColor: Colors.white38,

        title: Text(item.name,style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(item.desc,style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: Text("\$${item.price}",style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 18
        ),),
      ),
    );
  }
}
