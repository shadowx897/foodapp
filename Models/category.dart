import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {

  static const ID = 'id';
  static const NAME = 'name';
  static const IMAGE = 'image';


  String _id;
  String _name;
  String _image;

  //getters
  String get id => _id;
  String get name => _name;
  String get image => _image;


  CategoryModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
  }
}

class Category {
  final String name;
  final String image;

  Category({@required this.name,@required this.image});
}
