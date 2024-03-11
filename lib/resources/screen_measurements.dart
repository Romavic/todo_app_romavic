import 'package:flutter/material.dart';

double getWidthSizeScreen(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeightSizeScreen(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getToAppBar(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}
