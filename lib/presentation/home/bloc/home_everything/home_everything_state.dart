part of 'home_everything_bloc.dart';

abstract class HomeEverythingState extends Equatable {
  const HomeEverythingState();

  @override
  List<Object> get props => [];
}

class HomeEverythingInProgress extends HomeEverythingState {}

class HomeEverythingLoadInSuccess extends HomeEverythingState {
  final HomeEverythingEntities entities;

  const HomeEverythingLoadInSuccess({required this.entities});

  @override
  List<Object> get props => [entities];
}

class HomeEverythingLoadInFailure extends HomeEverythingState {}
