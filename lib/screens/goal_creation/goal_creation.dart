import 'package:zionApp/constants.dart';
import 'package:flutter/material.dart';
import 'package:zionApp/screens/goal_creation/components.dart/formulario.dart';

class GoalCreation extends StatefulWidget {
  const GoalCreation({ Key key }) : super(key: key);

  @override
  _GoalCreationState createState() => _GoalCreationState();
}

class _GoalCreationState extends State<GoalCreation> {
  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final totalController = TextEditingController();
  final inversionInicialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: FormularioGoalCreation(
              nombreController: nombreController,
              totalController: totalController,
              inversionInicialController: inversionInicialController,
              formKey: _formKey,
            )
          ),
        ],
      ),
    );
  }
}