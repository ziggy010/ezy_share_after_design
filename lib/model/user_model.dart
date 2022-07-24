import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class UserModel {
  String? uid;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? address;

  UserModel(
      {this.uid, this.fullName, this.phoneNumber, this.email, this.address});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
    };
  }
}

class CardForm {
  String? uid;
  String? fullName;
  String? profession;
  String? companyName;
  String? designation;
  String? phoneNumber;
  String? email;

  CardForm({
    this.fullName,
    this.profession,
    this.companyName,
    this.designation,
    this.phoneNumber,
    this.email,
  });
  factory CardForm.fromMap(map) {
    return CardForm(
      fullName: map['fullName'],
      profession: map['profession'],
      companyName: map['companyName'],
      designation: map['designation'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'profession': profession,
      'companyName': companyName,
      'designation': designation,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
