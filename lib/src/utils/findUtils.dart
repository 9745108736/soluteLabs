import 'dart:async';

import 'package:solute_labs/src/constants/styles.dart';
import 'package:solute_labs/src/utils/sharedPrefUtils.dart';

import '../../getIt.dart';

class FindUtils {
  static final MyStyles = getIt<Mystyles>();
  static final sharePref = getIt<SharedPrefUtils>();


  static delayedMethodCall({Function fn, int duration}) {
    Timer(Duration(seconds: duration ?? 2), () {
      fn();
    });
  }
}
