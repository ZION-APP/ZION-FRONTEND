import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/screens/goal_creation/components.dart/goal_model.dart';
import 'package:zionapp/screens/goal_creation/goal_creation.dart';
import 'package:zionapp/size_config.dart';
import 'components.dart/goal_box.dart';
import 'components.dart/goal_model.dart';

class GoalList extends StatefulWidget {
  const GoalList({Key key}) : super(key: key);

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
      for (final res in response.data) {
        final Goal goal = Goal(
            id: res['id'] as int,
            name: res['name'].toString(),
            initAmount: res['init_amount'] as int,
            targetAmount: res['target_amount'] as int,
            monthlyAmount: double.parse(res['montly_amount'].toString()),
            currentAmount: res['current_amount'] as int,
            targetDate: res['target_date'] as String,
            status: res['status'] as String);
        goal.setTipoFondo(res['fund_id'] as int);
        debugPrint(response.data.toString());
        setState(() {
          if (res['status'] == 'active') {
            goals.add(goal);
          }
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
            ? CustomScrollView(slivers: [
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: generateGoalList(),
                    ))
              ])
            : Cargando());
  }

  List<Widget> generateGoalList() {
    final List<Widget> result = [];
    for (final goal in goals) {
      result.add(SizedBox(height: getProportionateScreenHeight(30)));
      result.add(
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: kSecondaryColor, width: 3),
              borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: getProportionateScreenWidth(320),
            child: Column(
              children: [
                GoalBox(
                  idMeta: goal.id,
                  nombreMeta: goal.name,
                  montoActual: goal.currentAmount,
                  metaTotal: goal.targetAmount,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(20)),
                  child: DefaultButton(
                    func: () async {
                      final int result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoalCreation(
                                    isUpdateForm: true,
                                    goalId: goal.id,
                                  )));
                      debugPrint(result.toString());
                      try {
                        setState(() {
                          goals = [];
                        });
                        await getGoalList();
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                    label: "Actualizar Cuenta",
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(20)),
                  child: DefaultButton(
                    func: () async {
                      await removeGoal(goal);
                      try {
                        setState(() {
                          goals = [];
                        });
                        await getGoalList();
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                    colorFondo: Colors.red,
                    label: "Eliminar Meta",
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
              ],
            ),
          ),
        ),
      );
    }
    result.add(SizedBox(height: getProportionateScreenHeight(50)));
    result.add(
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(30)),
        child: DefaultButton(
          func: () async {
            final int result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const GoalCreation(isUpdateForm: false)));
            debugPrint(result.toString());
            try {
              setState(() {
                goals = [];
              });
              await getGoalList();
            } catch (e) {
              debugPrint(e.toString());
            }
          },
          label: "Registrar nueva meta",
        ),
      ),
    );
    return result;
  }

  Future<void> removeGoal(Goal goal) async {
    final String token = await storage.read(key: 'token');
    try {
      // ignore: unused_local_variable
      final response = await dioClient.put('$kapiUrl/goals/me/${goal.id}',
          options: Options(headers: {'Authorization': token}),
          data: {
            'name': goal.name,
            'current_amount': goal.currentAmount,
            'status': 'inactive'
          });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
