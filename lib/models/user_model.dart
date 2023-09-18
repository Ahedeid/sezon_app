// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String password;
  final String phoneNumber;
  final String imageLink;
  UserModel({
    this.id,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
    this.imageLink = '',
  });
  toJson() => {
        "FullName": fullName,
        "Phone": phoneNumber,
        "Password": password,
        "imageLink": imageLink,
      };

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullName: data['FullName'],
      password: data['Password'],
      phoneNumber: data['Phone'],
      imageLink: data['imageLink'],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['FullName'],
      password: json['Password'],
      phoneNumber: json['Phone'],
      imageLink: json['imageLink'],
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, password: $password, phoneNumber: $phoneNumber, imageLink: $imageLink,)';
  }

  UserModel copyWith({
    String? eid,
    String? fullName,
    String? password,
    String? phoneNumber,
    String? imageLink,
  }) {
    return UserModel(
      id: eid,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageLink: imageLink ?? this.imageLink,
    );
  }
}
