import 'package:equatable/equatable.dart';

abstract class FormularioState extends Equatable {}

class FormularioInitial extends FormularioState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FormularioLoading extends FormularioState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FormularioFailed extends FormularioState {
  final String error;
  FormularioFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

// Only the FormularioLoaded event needs to contain data
class FormularioCompleted extends FormularioState {
  final dynamic login;

  FormularioCompleted(this.login);

  @override
  // TODO: implement props
  List<Object> get props => [login];
}
