import 'package:get/get.dart';
import 'package:rickandmorty/models/counterModel.dart';
import 'package:rickandmorty/models/imageModel.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/controller/homePageController.dart';
import 'package:rickandmorty/customWidgets/cards.dart';
import 'package:rickandmorty/models/counterModel.dart';
import 'package:rickandmorty/models/imageModel.dart';
import 'package:rickandmorty/screens/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  SharedPreferences prefs;
  bool allDataLoaded = false;
  List<ImageModel> imageLists = [];
  List<ImageModel> selectedimageLists = [];
  int counter;

  void onInit() {
    super.onInit();
    getImages();
  }

  Future<Null> signOut() async {
    await FirebaseAuth.instance.signOut();
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => SignUp(),
    //     ));
  }

  Future<void> getImages() async {
    try {
      var response = await http
          .get(Uri.parse('https://rickandmortyapi.com/api/character'));
      var res = jsonDecode(response.body);
      for (int i = 0 ; i < res["results"].length; i++) {
        imageLists.add(ImageModel.fromJson(res["results"][i]));
        print(imageLists[i].url);
      }

      allDataLoaded = true;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  final db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> setcounterValue(int index) {
    settings.loadedlistValue = index;
    print("settings.loadedlistValue" + settings.loadedlistValue.toString());
    return db
        .collection("userData")
        .doc(auth.currentUser.uid)
        .collection("counterValue")
        .doc('counterValue')
        .set(settings.toJson());
  }

  Future<void> getCounterData() {
    return db
        .collection("userData")
        .doc(auth.currentUser.uid)
        .collection("counterValue")
        .doc('counterValue')
        .get()
        .then((value) => {
              counter = value["loadedlistValue"] == null
                  ? 0
                  : value["loadedlistValue"]
            });
  }

  initilazir() async {
    prefs = await SharedPreferences.getInstance();
  }

  final settings = new CounterModel(null);
}
