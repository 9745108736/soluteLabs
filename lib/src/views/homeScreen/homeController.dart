import 'package:solute_labs/getIt.dart';
import 'package:solute_labs/src/models/core/userListModel.dart';
import 'package:solute_labs/src/models/helper/database_helper.dart';
import 'package:solute_labs/src/provider/homeProvider.dart';

class HomeController {
  final homeProvider = getIt<HomeProvider>();

  // List<Map> allUserList = [];

  List userList = [];
  final dbHelper = DatabaseHelper.instance;

// List<Map<String, dynamic>> userList;

}
