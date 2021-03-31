import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const UID = 'uid';
  static const LIKED_FOOD = 'likedFood';
  static const LIKED_RESTAURANTS = 'likedRestaurants';

  String _name;
  String _email;
  String _uid;
  List _likedFood;
  List _likedRestaurants;

  //getters
  String get name => _name;
  String get email => _email;
  String get uid => _uid;
  List get likedFood => _likedFood;
  List get likedRestaurants => _likedRestaurants;

  UserModel.fromSnapshot(DocumentSnapshot snapshot){
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _uid = snapshot.data[UID];
    _likedFood = snapshot.data[LIKED_FOOD] ?? [];
    _likedRestaurants = snapshot.data[LIKED_RESTAURANTS] ?? [];
  }
}

class User {
  final String uid;

  User({this.uid});
}