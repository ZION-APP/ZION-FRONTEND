import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

import 'components.dart/goal_model.dart';

class GoalSimulation extends StatefulWidget {
  final int goalId;
  final Function removeGoal;

  const GoalSimulation({Key key, @required this.goalId, this.removeGoal})
      : super(key: key);

  @override
  _GoalSimulationState createState() => _GoalSimulationState();
}

class _GoalSimulationState extends State<GoalSimulation> {
  Goal goalSim;
  bool loading = true;

  Future<void> getGoalByID() async {
    try {
      debugPrint(widget.goalId.toString());
      final String token = await storage.read(key: 'token');
      final Response res = await dioClient.get(
          '$kapiUrl/goals/me/${widget.goalId}',
          options: Options(headers: {'Authorization': token}));
      debugPrint(res.data.toString());
      final Goal goal = Goal(
          id: res.data['id'] as int,
          name: res.data['name'].toString(),
          initAmount: res.data['init_amount'] as int,
          targetAmount: res.data['target_amount'] as int,
          monthlyAmount: double.parse(res.data['montly_amount'].toString()),
          currentAmount: res.data['current_amount'] as int,
          targetDate: res.data['target_date'] as String,
          status: res.data['status'] as String);
      goal.setTipoFondo(res.data['fund_id'] as int);
      setState(() {
        goalSim = goal;
      });
      setState(() {
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    getGoalByID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String nombreMeta = "";
    if (goalSim != null) nombreMeta = goalSim.name;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: kPrimaryLightColor,
          ),
          title: Text(
            nombreMeta,
            style: const TextStyle(color: kPrimaryLightColor),
          ),
          centerTitle: true,
          backgroundColor: kSecondaryColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Eliminar',
              onPressed: () {
                widget.removeGoal(goalSim.id);
                AutoRouter.of(context).pop();
              },
            ),
          ],
        ),
        body: !loading
            ? SizedBox(
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            SizedBox(height: getProportionateScreenHeight(40)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(14)),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueGrey[200], width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[300]))),
                                        child: SizedBox(
                                          width:
                                              getProportionateScreenWidth(280),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  height:
                                                      getProportionateScreenHeight(
                                                          25)),
                                              const Text(
                                                'Simulación',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 25,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                  height:
                                                      getProportionateScreenHeight(
                                                          15))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      20)),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              25)),
                                                  const Text(
                                                    'Fondo Recomendado',
                                                    style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              25)),
                                                  const Text(
                                                    'Monto Inicial',
                                                    style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              25)),
                                                  const Text(
                                                    'Monto Objetivo',
                                                    style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    height:
                                                        getProportionateScreenHeight(
                                                            25)),
                                                Text(
                                                  goalSim.tipoFondo,
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        getProportionateScreenHeight(
                                                            25)),
                                                Text(
                                                  "\$ ${goalSim.initAmount.toString()}",
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        getProportionateScreenHeight(
                                                            25)),
                                                Text(
                                                  "\$ ${goalSim.targetAmount.toString()}",
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              getProportionateScreenHeight(50)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(40)),
                            const Text(
                              'Aportación mensual',
                              style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(40)),
                            Text(
                              "\$ ${goalSim.monthlyAmount.toString()}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 28,
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(30)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(30)),
                              child: DefaultButton(
                                func: () => {},
                                label: "Crear Inversión",
                                colorFondo: kPrimaryColor,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )
            : Cargando());
  }
}
