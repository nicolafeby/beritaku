import 'package:beritaku/core/model/argument/home_everything_arg.dart';
import 'package:beritaku/core/model/request/request_home_everything_model.dart';
import 'package:beritaku/core/utils/app_constant.dart';
import 'package:beritaku/domain/home_everything/entities/home_everything_entities.dart';
import 'package:beritaku/domain/home_everything/usecases/home_everything_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_everything_event.dart';
part 'home_everything_state.dart';

class HomeEverythingBloc
    extends Bloc<HomeEverythingEvent, HomeEverythingState> {
  final HomeEverythingUsecase usecase;
  HomeEverythingBloc({
    required this.usecase,
  }) : super(HomeEverythingInProgress()) {
    on<HomeEverythingStarted>(_onHomeEverythingStarted);
  }

  _onHomeEverythingStarted(
      HomeEverythingStarted event, Emitter<HomeEverythingState> emit) async {
    final params = RequestHomeEverythingModel(
      apiKey: AppConstant.apiKey,
      q: event.arg?.q ?? 'news',
      from: event.arg?.from,
      to: event.arg?.to,
      sortBy: event.arg?.sortBy,
    );

    final resp = await usecase.call(params);

    final updateState = resp.fold(
      (l) => HomeEverythingLoadInFailure(),
      (r) => HomeEverythingLoadInSuccess(entities: r),
    );

    emit(updateState);
  }
}
