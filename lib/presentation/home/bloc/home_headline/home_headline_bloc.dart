import 'package:beritaku/core/model/argument/home_headline_arg.dart';
import 'package:beritaku/core/model/request/request_home_headline_model.dart';
import 'package:beritaku/core/utils/app_constant.dart';
import 'package:beritaku/domain/home_headline/entities/home_headline_entities.dart';
import 'package:beritaku/domain/home_headline/usecases/home_headline_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_headline_event.dart';
part 'home_headline_state.dart';

class HomeHeadlineBloc extends Bloc<HomeHeadlineEvent, HomeHeadlineState> {
  final HomeHeadlineUsecase usecase;
  HomeHeadlineBloc({
    required this.usecase,
  }) : super(HomeHeadlineInProgress()) {
    on<HomeHeadlineStarted>(_onHomeHeadlineStarted);
  }

  _onHomeHeadlineStarted(
    HomeHeadlineStarted event,
    Emitter<HomeHeadlineState> emit,
  ) async {
    final params = RequestHomeHeadlineModel(
      apiKey: AppConstant.apiKey,
      language: event.arg.language,
      country: event.arg.country,
    );

    final resp = await usecase.call(params);

    final updateState = resp.fold(
      (l) => HomeHeadlineLoadInFailure(),
      (r) => HomeHeadlineLoadInSuccess(entities: r),
    );

    emit(updateState);
  }
}
