import 'package:flutter/material.dart';

double appHight(BuildContext context, double h) {
  return MediaQuery.of(context).size.height * h;
}

double appWidth(BuildContext context, double h) {
  return MediaQuery.of(context).size.width * h;
}
