import 'package:flutter/material.dart';
import 'package:solute_labs/src/constants/colors.dart';
import 'package:solute_labs/src/widgets/textWidgets.dart';

Widget MyAppBarWidet({String title}) {
  return AppBar(
    backgroundColor: MyColors.white.redC,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    title: MyTextWidgets.textWidgetRegular(
      str: title ?? "Shops",
    ),
  );
}
