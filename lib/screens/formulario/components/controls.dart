import 'package:flutter/material.dart';

class FormControllers extends StatelessWidget {
  final Function() onStepContinue;
  final Function() onStepCancel;
  const FormControllers({this.onStepContinue, this.onStepCancel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TextButton(
          onPressed: onStepContinue,
          child: const Text('NEXT'),
        ),
        TextButton(
          onPressed: onStepCancel,
          child: const Text('CANCEL'),
        ),
      ],
    );
  }
}
