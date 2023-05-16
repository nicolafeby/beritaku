part of 'home_everything_bloc.dart';

abstract class HomeEverythingEvent extends Equatable {
  const HomeEverythingEvent();

  @override
  List<Object?> get props => [];
}

class HomeEverythingStarted extends HomeEverythingEvent {
  final HomeEverythingArg? arg;
  const HomeEverythingStarted({this.arg});

  @override
  List<Object?> get props => [arg];
}
