import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:solute_labs/src/models/helper/urlHelper.dart';
import 'package:solute_labs/src/utils/findUtils.dart';

class ApiService {
  String endpoint = UrlHelper.baseUrl; //base url

  Future<Either<Exception, String>> getApiRequest({String url}) async {
    //get api method only end point need to send
    String _token = await FindUtils.sharePref.getTokenOnly();

    try {
      print(url);
      final _fullRUL = endpoint + url;
      print("Final url - $_fullRUL");
      final response = await http.get(
        Uri.parse(_fullRUL),
        headers: _token != null
            ? {
                "Content-Type": "application/json",
                "Authorization": "Bearer ${_token}",
              }
            : {
                "Content-Type": "application/json",
              },
      );
      if (response.statusCode == 200) {
        return Right(response.body);
      } else {
        Exception e;
        return (Left(e));
      }
    } catch (e) {
      return (Left(e));
    }
  }

  Future<Either<Exception, String>> postApiRequest({
    String url,
    Map<String, dynamic> bodyParam,
  }) async {
    //Post api call need to pass url endPoint with body parameter

    String _token = await FindUtils.sharePref.getTokenOnly();
    try {
      var fullUrl = endpoint + url;
      print("bodyParam - $bodyParam");
      print("Full url - $fullUrl");

      final response = await http.post(
        Uri.parse(fullUrl),
        headers: _token != null
            ? {
                "Content-Type": "application/json",
                "Authorization": "Bearer ${_token}",
              }
            : {
                "Content-Type": "application/json",
              },
        body: json.encode(bodyParam),
      );
      print("STatus code - ${response.statusCode}");
      if (response.statusCode == 200) {
        print(response.body);
        return Right(response.body);
      } else {
        Map<String, dynamic> bodyParam = {
          "status": "300",
          "msg": "Internal error",
        };

        return Right(json.encode(bodyParam));
      }
    } catch (e) {
      return (Left(e));
    }
  }
}
