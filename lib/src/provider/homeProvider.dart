import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:solute_labs/src/models/glitch/glitch.dart';
import 'package:solute_labs/src/models/helper/NetworkHelper.dart';
import 'package:solute_labs/src/models/helper/urlHelper.dart';

class HomeProvider extends ChangeNotifier {
  final _helper = CommonHelper(); //login helper
  final streamController = StreamController<
      Either<Glitch, String>>(); //login method stream controller,

  Stream<Either<Glitch, String>> get homeResStream {
    return streamController.stream;
  }

  Future<void> getHomeMethod() async {
    final loginRes = await _helper.getGM(
      url: UrlHelper.getUsersUrl,
    );
    streamController.add(loginRes);
  }
}
