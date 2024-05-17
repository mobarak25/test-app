import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/navigator/iflutter_navigator.dart';
import 'package:test_app/features/data/data_sources/local_keys.dart';
import 'package:test_app/features/data/data_sources/remote_constants.dart';
import 'package:test_app/features/domain/entities/flutter_repository_response.dart';
import 'package:test_app/features/domain/repositories/api_repo.dart';
import 'package:test_app/features/domain/repositories/local_storage_repo.dart';
import 'package:test_app/features/presentation/details/view/details_screen.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._iFlutterNavigator, this._apiRepo, this._localStorageRepo)
      : super(HomeInitial()) {
    on<GetUser>(_getUser);
    on<PageIncrement>(_pageIncrement);
    on<GoToDetails>(_goToDetails);

    add(GetUser());
  }

  final IFlutterNavigator _iFlutterNavigator;
  final ApiRepo _apiRepo;
  final LocalStorageRepo _localStorageRepo;

  FutureOr<void> _getUser(GetUser event, Emitter<HomeState> emit) async {
    // Try to read from Loal Stroage==========
    final repositoryFromDB = await _localStorageRepo
        .readModel<FlutterRepository>(key: flutterRepositoryDB);

    if (repositoryFromDB != null) {
      emit(state.copyWith(flutterRepository: repositoryFromDB));
    }

    // Data get from server==========
    final posts = await _apiRepo.get<FlutterRepository>(
        endpoint: userRepositories(
            query: "flutter", pageNo: state.page, sort: 'stars'));

    if (posts != null) {
      emit(state.copyWith(flutterRepository: posts));

      // write data to local stroage==========
      await _localStorageRepo.writeModel(
          key: flutterRepositoryDB, value: posts);
    }
  }

  FutureOr<void> _pageIncrement(
      PageIncrement event, Emitter<HomeState> emit) async {
    int totalPage = state.page + 1;
    //I put here static value 100 it's show first 1000 items from server
    if (totalPage <= 100) {
      if (!state.isLoading) {
        emit(state.copyWith(isLoading: true, page: totalPage));

        final productPagination = await _apiRepo.get<FlutterRepository>(
            endpoint: userRepositories(
                query: "flutter", pageNo: totalPage, sort: 'stars'));

        emit(state.copyWith(isLoading: false));

        if (productPagination != null) {
          emit(state.copyWith(
              flutterRepository: FlutterRepository(
            items: state.flutterRepository.items! + productPagination.items!,
          )));
        }
      }
    } else if (!state.isLoading) {
      emit(state.copyWith(isEndList: true));
    }
  }

  FutureOr<void> _goToDetails(GoToDetails event, Emitter<HomeState> emit) {
    _iFlutterNavigator.push(DetailsScreen.route(data: event.details));
  }
}
