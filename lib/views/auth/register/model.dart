part of 'bloc.dart';

class UserModel {
  String? name;
  String? image;
  String? cover;
  String? bio;
  String? email;
  String? phone;
  String? uId;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.image,
    required this.cover,
    required this.bio
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    uId = json['uId'] ?? "";
    image = json['image'] ?? "";
    cover = json['cover'] ?? "";
    bio = json['bio'] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': image,
      'cover': cover,
      'bio': bio,
    };
  }
}
