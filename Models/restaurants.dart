import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {

  static const ID = 'id';
  static const NAME = 'name';
  static const AVG_PRICE = 'avgPrice';
  static const RATING = 'rating';
  static const IMAGE = 'image';
  static const POPULAR = 'popular';

  String _id;
  String _name;
  double _avgPrice;
  double _rating;
  String _image;
  String _popular;

  //getters
  String get id => _id;
  String get name => _name;
  double get rating => _rating;
  String get image => _image;
  String get popular => _popular;
  double get avgPrice => _avgPrice;

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _rating = snapshot.data[RATING];
    _image = snapshot.data[IMAGE];
    _avgPrice = snapshot.data[AVG_PRICE];
    _popular = snapshot.data[POPULAR];
  }
  
}