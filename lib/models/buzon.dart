// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Buzon {
  @JsonKey(name: "ID")
  String id;
  @JsonKey(name: "titulo")
  String titulo;
  @JsonKey(name: "cuerpo")
  String cuerpo;
  @JsonKey(name: "created_at")
  String fechaCreacion;
}
