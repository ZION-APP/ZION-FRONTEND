import 'package:equatable/equatable.dart';

abstract class BuzonState extends Equatable {}

class BuzonLoading extends BuzonState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class BuzonFailed extends BuzonState {
  final String error;
  BuzonFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [this.error];
}

// Only the BuzonLoaded event needs to contain data
class BuzonCompleted extends BuzonState {
  final dynamic noticias;

  BuzonCompleted(this.noticias);

  @override
  // TODO: implement props
  List<Object> get props => [this.noticias];
}
