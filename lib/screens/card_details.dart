import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ezy_share_got_design/model/user_model.dart';
import 'package:ezy_share_got_design/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class CardScreen extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  String? userId;
  static const String id = 'CardScreen';
  CardScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  final fullNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final designationEditingController = TextEditingController();
  final companyNameEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();
  final professionEditingController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final _formkey = GlobalKey<FormState>();

  late bool _isLoading;

  //snackbar for showing error
  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  createCard() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    CardForm cardForm = CardForm();

    cardForm.uid = user!.uid;
    cardForm.email = emailEditingController.text;
    cardForm.fullName = fullNameEditingController.text;
    cardForm.phoneNumber = phoneNumberEditingController.text;
    cardForm.designation = designationEditingController.text;
    cardForm.companyName = companyNameEditingController.text;
    cardForm.profession = professionEditingController.text;
    cardForm.uid = widget.userId;
    Reference ref = FirebaseFirestore.instance
        .collection("${widget.userId}/users")
        .doc('card')
        .set(cardForm.toMap()) as Reference;
    Fluttertoast.showToast(msg: "Card created!");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
  }

  @override
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
                          controller: fullNameEditingController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "name"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            fullNameEditingController.text = value!;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: professionEditingController,
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
                            professionEditingController.text = value!;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: companyNameEditingController,
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
                            companyNameEditingController.text = value!;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: designationEditingController,
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
                            designationEditingController.text = value!;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneNumberEditingController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "phone"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            phoneNumberEditingController.text = value!;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailEditingController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "email"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailEditingController.text = value!;
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
                      createCard();

                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const Center(
                                  child: SpinKitFadingGrid(
                                size: 50,
                                color: Colors.teal,
                              )));
                    } else {
                      showSnackBar("Please fill the form first",
                          const Duration(milliseconds: 700));
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // ));
  }
}
