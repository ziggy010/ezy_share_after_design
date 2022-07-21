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
