import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {

  static const ID = 'id';
  static const NAME = 'name';
  static const PRODUCT_ID = 'productId';
  static const PRICE = 'price';
  static const STATUS = 'status';

  String _id;
  String _name;
  String _productId;
  double _price;
  String _status;

  //getters
  String get id => _id;
  String get name => _name;
  String get productId => _productId;
  String get status => _status;
  double get price => _price;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _productId = snapshot.data[PRODUCT_ID];
    _status = snapshot.data[STATUS];
    _price = snapshot.data[PRICE];
  }
  
}
