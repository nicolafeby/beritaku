part of 'home_headline_bloc.dart';

abstract class HomeHeadlineState extends Equatable {
  const HomeHeadlineState();

  @override
  List<Object> get props => [];
}

class HomeHeadlineInProgress extends HomeHeadlineState {}

class HomeHeadlineLoadInSuccess extends HomeHeadlineState {
  final HomeHeadlineEntities entities;

  const HomeHeadlineLoadInSuccess({required this.entities});

  @override
  List<Object> get props => [entities];
}

class HomeHeadlineLoadInFailure extends HomeHeadlineState {}
