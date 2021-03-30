import 'dart:convert';
import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:solute_labs/src/constants/colors.dart';
import 'package:solute_labs/src/models/core/userListModel.dart';
import 'package:solute_labs/src/models/helper/database_helper.dart';
import 'package:solute_labs/src/utils/findUtils.dart';
import 'package:solute_labs/src/widgets/appBarWidget.dart';
import 'package:solute_labs/src/widgets/catchNetworkImageWidget.dart';
import 'package:solute_labs/src/widgets/commonWidget.dart';
import 'package:solute_labs/src/widgets/textWidgets.dart';

import 'homeController.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AfterLayoutMixin {
  HomeController _homeController = new HomeController();

  @override
  void afterFirstLayout(BuildContext context) {
    _homeController.homeProvider.getHomeMethod();
    _homeController.homeProvider.homeResStream.listen((snapshot) {
      snapshot.fold(
          (l) => {
                print("Somthing went wrong - ${l.message}"),
              }, (r) {
        //if everything is correct this block will execute
        // print("Login response encoded - ${jsonEncode(r)}");
        var res = json.decode(r);
        _homeController.userList = res;
        print("json res - ${_homeController.userList.length}");
        _manageLoading(loading: false);
      });
    });
  }

  bool _showLoading = true;

  _manageLoading({bool loading}) {
    _showLoading = loading ?? !_showLoading;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWidet(title: "Home"),
      backgroundColor: MyColors.white.redC,
      body: _showLoading ? Container() : _body(),
    );
  }

  Widget _body() {
    return ListView.separated(
      itemCount: _homeController.userList.length,
      separatorBuilder: (context, position) {
        return Divider();
      },
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: CachedNetworkImageWidget(
                  imageUrl:
                      _homeController.userList[position]["avatar_url"] ?? ""),
            ),
            title: MyTextWidgets.textWidgetRegular(
                str: _homeController.userList[position]["login"], fontSize: 20),
            trailing: InkWell(
              onTap: () {
                DatabaseHelper.saveSingleUser(
                    c_id: _homeController.userList[position]["id"].toString(),
                    context: context,
                    Image: _homeController.userList[position]["avatar_url"],
                    name: _homeController.userList[position]["login"]);
              },
              child: Icon(LineIcons.heart),
            ),
          ),
        );

        // _singleItem(
        //   imgUrl: _homeController.userList[position]["avatar_url"],
        //   name: _homeController.userList[position]["login"],
        // );
      },
    );
  }
}
