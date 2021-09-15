import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/customWidgets/cards.dart';
import 'package:rickandmorty/models/counterModel.dart';
import 'package:rickandmorty/models/imageModel.dart';
import 'package:rickandmorty/screens/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImageModel> imageLists = [];
  List<ImageModel> selectedimageLists = [];
  int counter = 0;
  Timer timer;

  SharedPreferences prefs;
  bool allDataLoaded = false;
  String name;
  void initState() {
    super.initState();
    getnameData();
    getImages();
    initilazir();
    print(name);
  }

  initilazir() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<Null> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignUp(),
        ));
  }

  Future<void> getImages() async {
    try {
      var response = await http
          .get(Uri.parse('https://rickandmortyapi.com/api/character'));
      var res = jsonDecode(response.body);
      print(res["results"].length.toString());
      // int k= int.tryParse(source)es["results"].length;
      int m = prefs.getInt("index") == null ? 0 : prefs.getInt("index");
      for (int j = m; j < 20; j++) {
        imageLists.add(ImageModel.fromJson(res["results"][j]));
      }
      setState(() {
        allDataLoaded = true;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  final db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

 

  Future<void> getnameData() {
    return db
        .collection("userData")
        .doc(auth.currentUser.uid)
        .collection("name")
        .doc('name')
        .get()
        .then(
          (value) => setState(() => {
                name = value["name"] == null ? "somthing wrong" : value["name"]
              }),
        );
  }

  final settings = new CounterModel(null);

  @override
  Widget build(BuildContext context) {
    CardController controller;
                  timer =
        Timer.periodic(Duration(seconds: 10), (Timer t) => setState(() => {
              // counter = counter + 1,
          
          controller.triggerUp(
            
          ),
          
          
          
        }));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(47, 46, 65, 1),
          title: Text(
            'Hello ' + name,
            style: TextStyle(
              fontFamily: 'Bell MT',
              fontSize: 24,
              color: const Color(0xfff2f2f2),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                _signOut();
                // do something
              },
            )
          ],
        ),
        body: allDataLoaded
            ? imageLists.length == 0
                ? Center(
                    child: Text("You have Rated all the characters Thank you"))
                : Container(
                    alignment: Alignment.center,
                    child: TinderSwapCard(
                      maxWidth: MediaQuery.of(context).size.width - 20,
                      maxHeight: MediaQuery.of(context).size.width - 20,
                      minWidth: MediaQuery.of(context).size.width - 30,
                      minHeight: MediaQuery.of(context).size.width - 30,
                      swipeDown: false,
                      swipeUp: true,
                      cardBuilder: (ctx, idx) => Cardswid(imageLists[idx].url,
                          imageLists[idx].name, imageLists[idx].location),
                      totalNum: imageLists.length,
                      cardController: controller = CardController(),

                      swipeCompleteCallback:
                          (CardSwipeOrientation orientation, int index) {
     
                        if (orientation == CardSwipeOrientation.LEFT) {
                          setState(() {
                            counter = counter + 1;
                            print(counter.toString() + 'conter value');
                            prefs.setInt("index", counter);

                            Fluttertoast.showToast(
                                msg: "You rejeted " + imageLists[index].name,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.black,
                                fontSize: 16.0);
                            imageLists.removeAt(index);
                          });
                        } else if (orientation == CardSwipeOrientation.RIGHT) {
                          setState(() {
                            counter = counter + 1;
                            prefs.setInt("index", counter);

                            Fluttertoast.showToast(
                                msg: "You Selected " + imageLists[index].name,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.black,
                                fontSize: 16.0);
                            selectedimageLists.add(imageLists[index]);
                            print('selecte images list ' +
                                selectedimageLists.length.toString());
                            imageLists.removeAt(index);
                          });
                        }
                      },
                    ),
                  )
            : Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Justin Roiland himself voices both Rick and Morty."),
                ],
              )));
  }
}
