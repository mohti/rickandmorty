import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'Get.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/screens/locationNamelist.dart';

class Cardswid extends Card {
  String imagestr = " ";
  String titlestr = " ";
  String location = " ";
  Cardswid(this.imagestr, this.titlestr, this.location);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height - 20,
        width: MediaQuery.of(context).size.width - 20,
        child: Card(
          elevation: 5,
          semanticContainer: true,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imagestr,
              placeholder: (context, url) => Container(
                width: MediaQuery.of(context).size.width,

                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Color(0xffbebec4),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ),
      Positioned(
          bottom: 40,
          left: 25,
          child: Text(
            titlestr,
            style: TextStyle(fontSize: 18, color: Colors.white),
          )),
      Positioned(
          bottom: 20,
          left: 25,
          child: InkWell(
            
      onTap: () {
        Get.to(ListOflocation( location));
      },
                        child: Text(
              location,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )),
    ]));
  }
}
