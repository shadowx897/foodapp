import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemsModel {

  static const ID = 'id';
  static const NAME = 'name';
  static const PRODUCT_ID = 'productId';
  static const PRICE = 'price';
  static const IMAGE = 'image';
  static const QUANTITY = 'quantity';

  String _id;
  String _name;
  String _productId;
  double _price;
  String _image;
  int _quantity;

  //getters
  String get id => _id;
  String get name => _name;
  String get productId => _productId;
  String get image => _image;
  double get price => _price;
  int get quantity => _quantity;

  CartItemsModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _productId = snapshot.data[PRODUCT_ID];
    _image = snapshot.data[IMAGE];
    _price = snapshot.data[PRICE];
    _quantity = snapshot.data[QUANTITY];
  }
}