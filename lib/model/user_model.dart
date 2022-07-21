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
    this.uid = '',
    required this.fullName,
    required this.profession,
    required this.companyName,
    required this.designation,
    required this.phoneNumber,
    required this.email,
  });
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'fullName': fullName,
        'profession': profession,
        'companyName': companyName,
        'designation': designation,
        'phoneNumber': phoneNumber,
        'email': email,
      };
}
