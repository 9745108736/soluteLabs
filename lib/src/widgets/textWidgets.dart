import 'package:flutter/cupertino.dart';
import 'package:solute_labs/src/utils/findUtils.dart';

class MyTextWidgets {
  static textWidgetRegular({String str, double fontSize, Color color}) {
    return Text(
      str,
      style: FindUtils.MyStyles.styleNormal(
        fontSize: fontSize,
        fontColor: color,
      ),
    );
  }

  static textWidgetLight({String str, double fontSize, Color color}) {
    return Text(
      str,
      style: FindUtils.MyStyles.styleLight(
        fontSize: fontSize,
        fontColor: color,
      ),
    );
  }

  static textWidgetBold({String str, double fontSize, Color color}) {
    return Text(
      str,
      style: FindUtils.MyStyles.styleBold(
        fontSize: fontSize,
        fontColor: color,
      ),
    );
  }

  static textWidgetSemiBold({String str, double fontSize, Color color}) {
    return Text(
      str,
      style: FindUtils.MyStyles.styleBold(
        fontSize: fontSize,
        fontColor: color,
      ),
    );
  }
}
