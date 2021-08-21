import 'package:flutter/material.dart';
import 'package:zionapp/screens/goal_creation/components.dart/formulario.dart';
import 'package:zionapp/screens/goal_creation/components.dart/formulario_update.dart';

import '../../constants_config.dart';

class GoalCreation extends StatefulWidget {
  final bool isUpdateForm;
  final int goalId;

  const GoalCreation({Key key, @required this.isUpdateForm, this.goalId}) : super(key: key);

  @override
  _GoalCreationState createState() => _GoalCreationState();
}

class _GoalCreationState extends State<GoalCreation> {
  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final totalController = TextEditingController();
  final inversionInicialController = TextEditingController();
  final currentAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryLightColor,
        ),
        title: const Text(
          'Creación de meta',
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
              child: handleForm(),
            ),
          ],
        ),
      )
    );
  }

  Widget handleForm() {
    if(widget.isUpdateForm){
      return FormularioGoalUpdate(
        goalId: widget.goalId,
        nombreController: nombreController,
        currentAmountController: currentAmountController,
      );
    }else{
      return FormularioGoalCreation(
        nombreController: nombreController,
        totalController: totalController,
        inversionInicialController: inversionInicialController,
        formKey: _formKey,
      );
    }
  }
}
