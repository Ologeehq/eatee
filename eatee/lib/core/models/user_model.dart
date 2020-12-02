import 'package:flutter/foundation.dart';

class UserModel {
  final String imageUrl;
  final String id;
  final String fullName;
  final String email;
  final String phone;

  UserModel(
      {@required this.id,
      @required this.fullName,
      @required this.email,
      @required this.phone,
      this.imageUrl});

  // Name constructor for serializing the data from firebase
  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        phone = data['phone'],
        imageUrl = data['imageUrl'];

  // Transform data to json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "imageUrl": imageUrl ?? '',
    };
  }
}
