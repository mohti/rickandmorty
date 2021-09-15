import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ListOflocation extends StatefulWidget {
   ListOflocation(this.location);
  String location;
  @override
  _ListOflocationState createState() => _ListOflocationState();
}

class _ListOflocationState extends State<ListOflocation> {
  var nameList = [];
  var locationList = [];

  bool allDataLoaded = false;
  void initState() {
    super.initState();
    getImages();
  }

  Future<void> getImages() async {
    try {
      var response = await http
          .get(Uri.parse('https://rickandmortyapi.com/api/character'));
      var res = jsonDecode(response.body);
      print(res.toString() + "=========================");
      print("image url === " + res["results"][0]["name"]);
      print("results lenght" + res["results"].length.toString());

      for (int i = 0; i < res["results"].length; i++) {
        if(widget.location==res["results"][i]["location"]["name"])
        nameList.add(res["results"][i]["name"]);
        locationList.add(res["results"][i]["location"]["name"]);
        print(res["results"][i]["location"]["name"]);
      }

      setState(() {
        allDataLoaded = true;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      body: Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: nameList.length,
      itemBuilder: (ctx, idx) {
        return Container(
            child: Text(
          nameList[idx],
        ));
      },
    )),
    );
  }
}
