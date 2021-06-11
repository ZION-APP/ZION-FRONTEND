import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BuzonEvent extends Equatable {}

class GetBuzon extends BuzonEvent {
  BuildContext context;
  GetBuzon(this.context);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
