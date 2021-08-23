import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/routes/router.gr.dart';
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
      final List<Goal> goalsT = [];
      final Response response = await dioClient.get(
        '$kapiUrl/goals/me',
      );
      for (final res in response.data) {
        final Goal goal = Goal(
            id: res['id'] as int,
            name: res['name'].toString(),
            initAmount: res['init_amount'] as num,
            targetAmount: res['target_amount'] as num,
            monthlyAmount: res['montly_amount'] as num,
            currentAmount: res['current_amount'] as num,
            targetDate: res['target_date'] as String,
            status: res['status'] as String);
        goal.setTipoFondo(res['fund_id'] as int);
        debugPrint(response.data.toString());
        setState(() {
          if (res['status'] == 'active') {
            goalsT.add(goal);
          }
        });
      }
      setState(() {
        loading = false;
        goals = goalsT;
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
            ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.8,
                    child: CustomScrollView(slivers: [
                      SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            children: generateGoalList(),
                          ))
                    ]),
                  ),
                  Positioned(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(6)),
                      child: SizedBox(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.05,
                        child: DefaultButton(
                          func: () async {
                            final int result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GoalCreation(
                                        isUpdateForm: false)));
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
                    ),
                  ),
                ],
              )
            : Cargando());
  }

  List<Widget> generateGoalList() {
    final List<Widget> result = [];
    for (final goal in goals) {
      result.add(SizedBox(height: getProportionateScreenHeight(30)));
      result.add(
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: GestureDetector(
            onTap: () {
              AutoRouter.of(context).push(
                  GoalSimulationRoute(goalId: goal.id, removeGoal: removeGoal));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(18)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    GoalBox(
                      idMeta: goal.id,
                      nombreMeta: goal.name,
                      montoActual: goal.currentAmount,
                      metaTotal: goal.targetAmount,
                      tipoFondo: goal.tipoFondo,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       vertical: getProportionateScreenHeight(20)),
                    //   child: DefaultButton(
                    //     func: () async {
                    //       final int result = await Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => GoalCreation(
                    //                     isUpdateForm: true,
                    //                     goalId: goal.id,
                    //                   )));
                    //       debugPrint(result.toString());
                    //       try {
                    //         setState(() {
                    //           goals = [];
                    //         });
                    //         await getGoalList();
                    //       } catch (e) {
                    //         debugPrint(e.toString());
                    //       }
                    //     },
                    //     label: "Actualizar Cuenta",
                    //   ),
                    // ),
                    // SizedBox(height: getProportionateScreenHeight(10)),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       vertical: getProportionateScreenHeight(20)),
                    //   child: DefaultButton(
                    //     func: () async {
                    //       await removeGoal(goal);
                    //       try {
                    //         setState(() {
                    //           goals = [];
                    //         });
                    //         await getGoalList();
                    //       } catch (e) {
                    //         debugPrint(e.toString());
                    //       }
                    //     },
                    //     colorFondo: Colors.red,
                    //     label: "Eliminar Meta",
                    //   ),
                    // ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    result.add(SizedBox(height: getProportionateScreenHeight(50)));
    return result;
  }

  Future<void> removeGoal(int id) async {
    setState(() {
      loading = true;
    });
    final String token = await storage.read(key: 'token');
    try {
      // ignore: unused_local_variable
      final response = await dioClient.put('$kapiUrl/goals/me/$id',
          options: Options(headers: {'Authorization': token}),
          data: {'status': 'inactive'});
      await getGoalList();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}
