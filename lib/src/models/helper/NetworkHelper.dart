import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:solute_labs/src/models/glitch/NoInternetGlitch.dart';
import 'package:solute_labs/src/models/glitch/glitch.dart';
import 'package:solute_labs/src/models/service/ApiService.dart';

class CommonHelper {
  final api = ApiService();

  Future<Either<Glitch, String>> getGM({@required String url}) async {
    final apiResult = await api.getApiRequest(
      url: url,
    );
    return apiResult.fold((l) {
      return Left(NoInternetGlitch());
    }, (r) {
      // print(r);
      // final photo = LoginResponseModel.fromJson(jsonDecode(r));
      final photo = r;
      return Right(photo);
    });
  }

//    Map<String, dynamic> bodyParam = {"page": page};
  Future<Either<Glitch, String>> postGM(
      {@required String url, Map<String, dynamic> bodyParam}) async {
    final apiResult = await api.postApiRequest(
      url: url,
      bodyParam: bodyParam,
    );
    return apiResult.fold(
      (l) {
        return Left(NoInternetGlitch());
      },
      (r) {
        print(r);
        // final photo = LoginResponseModel.fromJson(jsonDecode(r));
        final photo = r;
        return Right(photo);
      },
    );
  }
}
