import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/routes/router.gr.dart';
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
  bool loading = true;
  List<Goal> goals = [];

  Future<void> getGoalList() async {
    try {
      final String token = await storage.read(key: 'token');
      final Response response = await dioClient.get('$kapiUrl/goals/me', 
                                      options: Options(headers: {'Authorization': token}));
      for (final res in response.data){
        final Goal goal = Goal(
          id: res['id'] as int,
          name: res['name'].toString(),
          initAmount: res['init_amount'] as int,
          targetAmount: res['target_amount'] as int,
          monthlyAmount: res['montly_amount'] as int,
          currentAmount: res['current_amount'] as int,
          targetDate: res['target_date'] as String,
          status: res['status'] as String
        );
        setState(() {
          goals.add(goal);
        });
      }
      setState(() {
        loading = false;
      });
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
    return SizedBox(
      child: !loading
        ?CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: generateGoalList(),
              )
            )
          ]
        )
      : Cargando()
    );
  }

  List<Widget> generateGoalList() {
    final List<Widget> result = [];
    for (final goal in goals){
      result.add(SizedBox(height: getProportionateScreenHeight(30)));
      result.add(GoalBox(
        idMeta: goal.id,
        nombreMeta: goal.name,
        montoActual: goal.currentAmount.toDouble(),
        metaTotal: goal.targetAmount.toDouble(),
      ));
    }
    result.add(SizedBox(height: getProportionateScreenHeight(50)));
    result.add(
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(30)),
        child: DefaultButton(
          func: () => {AutoRouter.of(context).push(const GoalCreationRoute())},
          label: "Registrar nueva meta",
        ),
      ),
    );
    return result;
  }
}