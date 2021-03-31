import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodapp/Scr/Models/user.dart';

class UserServices{
  String collection = 'Users';
  Firestore _firestore = Firestore.instance;

  void createUser(Map<String, dynamic> values) {
    String uid = values['uid'];
    _firestore.collection(collection).document(uid).setData(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    _firestore.collection(collection).document(values['uid']).updateData(values);
  }

  Future <UserModel> getUserById(String uid) =>
  _firestore.collection(collection).document(uid).get().then((doc){
    return UserModel.fromSnapshot(doc);
  });

}