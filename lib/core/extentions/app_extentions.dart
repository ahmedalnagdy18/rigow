import 'package:flutter/material.dart';

double appHight(BuildContext context, double h) {
  return MediaQuery.of(context).size.height * h;
}

double appWidth(BuildContext context, double h) {
  return MediaQuery.of(context).size.width * h;
}

//  appHight(context, 1)   to add hight by media Quere


// to Navigat to any page 

 // Navigator.of(context).push(MaterialPageRoute(     
 // builder: (context) => const Navbar()));