import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ezy_share_got_design/model/user_model.dart';
import 'package:ezy_share_got_design/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class CardScreen extends StatefulWidget {
  String? userId;
  static const String id = 'CardScreen';
  CardScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final professionController = TextEditingController();
  final designationController = TextEditingController();
  final companyNameController = TextEditingController();
  String? uid;
  String? fullName;
  String? profession;
  String? companyName;
  String? designation;
  String? phoneNumber;
  String? email;
  late bool _isLoading;

  //snackbar for showing error
  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future createCard() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance.ref();
    User? user = FirebaseAuth.instance.currentUser;
    // User? user = _auth.currentUser;
    UserModel loggedInUser = UserModel();
    CardForm cardForm = CardForm();

    cardForm.uid = widget.userId!;
    cardForm.fullName = fullNameController.text;
    cardForm.profession = professionController.text;
    cardForm.companyName = companyNameController.text;
    cardForm.designation = designationController.text;
    cardForm.phoneNumber = phoneNumberController.text;
    cardForm.email = emailController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user!.uid)
        .set(cardForm.toMap());

    Fluttertoast.showToast(msg: "Card created! )");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card from'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            child: Column(
              children: [
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: fullNameController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "${loggedInUser.fullName}"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            fullName = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: professionController,
                          decoration: const InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Profession"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            profession = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: companyNameController,
                          decoration: const InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Company Name"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            companyName = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: designationController,
                          decoration: const InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Designation"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            designation = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "${loggedInUser.phoneNumber}"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            phoneNumber = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "${loggedInUser.email}"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                                    child: SpinKitFadingGrid(
                                  size: 50,
                                  color: Colors.teal,
                                )));
                        createCard();
                      } else {
                        showSnackBar("Please fill the form first",
                            const Duration(milliseconds: 700));
                      }
                    },
                    child: const Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
    // ));
  }
}
