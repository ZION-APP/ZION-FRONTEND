import 'package:equatable/equatable.dart';

abstract class FormularioEvent extends Equatable {}

class ContinueFormulario extends FormularioEvent {
  final dynamic formulario;
  ContinueFormulario(this.formulario);

  @override
  // TODO: implement props
  List<Object> get props => [formulario];
}

class CloseFormulario extends FormularioEvent {
  CloseFormulario();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
