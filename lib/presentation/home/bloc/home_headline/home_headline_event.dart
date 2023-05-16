part of 'home_headline_bloc.dart';

abstract class HomeHeadlineEvent extends Equatable {
  const HomeHeadlineEvent();

  @override
  List<Object> get props => [];
}

class HomeHeadlineStarted extends HomeHeadlineEvent {
  final HomeHeadlineArg arg;
  const HomeHeadlineStarted({required this.arg});

  @override
  List<Object> get props => [arg];
}
