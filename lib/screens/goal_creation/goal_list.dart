import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/screens/goal_creation/components.dart/goal_model.dart';
import 'package:zionapp/size_config.dart';
import 'components.dart/goal_box.dart';
import 'components.dart/goal_model.dart';

class GoalList extends StatefulWidget {
  const GoalList({ Key key }) : super(key: key);

  @override
  _GoalListState createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  List<Goal> goals = [];

  Future<void> getGoalList() async {
    try {
      final String token = "Bearer ${await storage.read(key: 'token')}";
      debugPrint(token);
      Response response = await Dio().get('$kapiUrl/goals/me', 
                                      options: Options(headers: {'Authorization': token}));
      debugPrint(response.data[0]['name'].toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
 
  @override
  void initState() {
    super.initState();
    getGoalList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryLightColor,
        ),
        title: const Text(
          'Metas',
          style: TextStyle(color: kPrimaryLightColor),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      body: SizedBox(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(30)),
                  GoalBox(
                    nombreMeta: 'Una Meta',
                    montoActual: 1230.00,
                    metaTotal: 343334.00,
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  GoalBox(
                    nombreMeta: 'Una Meta',
                    montoActual: 1230.00,
                    metaTotal: 343334.00,
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  GoalBox(
                    nombreMeta: 'Una Meta',
                    montoActual: 1230.00,
                    metaTotal: 343334.00,
                  ),
                  SizedBox(height: getProportionateScreenHeight(50)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(30)),
                    child: DefaultButton(
                      func: () => {},
                      label: "Registrar nueva meta",
                    ),
                  ),
                ],
              )
            )
          ]
        )
      )
    );
  }
}