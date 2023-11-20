import 'package:my_app/item_class/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import 'manupulate_data_store.dart';

class CartModel {
  //singlton object
 /* static final cartModel=CartModel._internal();
  CartModel._internal();
  factory CartModel()=>cartModel;


  */
  late CatalogModel _catalog;
  final List<int> _itemId = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemId.map((id) => _catalog.getById(id)).toList();

  //get item total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

// Add items using id
  void add(Item item) {
    _itemId.add(item.id);
  }

  // Remove item using id

  void remove(Item item) {
    _itemId.remove(item.id);
  }
}
// class AddMutation extends VxMutation<MyStore>{
//   @override
//   final Item item;
//
//   AddMutation(this.item);
//   perform() {
//     store.cart._itemId.add(item.id);
//   }
//
// }
class AddMutation extends VxMutation<MyStore>{
  @override
  final Item item;

  AddMutation(this.item);
  perform() {
    store?.cart._itemId.add(item.id);
  }

}
class RemoveMutation extends VxMutation<MyStore>{
  @override
  final Item item;

  RemoveMutation(this.item);

  perform() {
    store?.cart._itemId.remove(item.id);
  }

}