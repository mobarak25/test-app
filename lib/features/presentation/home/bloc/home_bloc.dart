import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/navigator/iflutter_navigator.dart';
import 'package:test_app/features/data/data_sources/remote_constants.dart';
import 'package:test_app/features/domain/entities/default_response.dart';
import 'package:test_app/features/domain/entities/posts.dart';
import 'package:test_app/features/domain/repositories/api_repo.dart';
import 'package:test_app/features/domain/repositories/local_storage_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._iFlutterNavigator, this._apiRepo, this._localStorageRepo)
      : super(HomeInitial()) {
    on<GetUser>(_getUser);

    add(GetUser());
  }

  final IFlutterNavigator _iFlutterNavigator;
  final ApiRepo _apiRepo;
  final LocalStorageRepo _localStorageRepo;

  FutureOr<void> _getUser(GetUser event, Emitter<HomeState> emit) async {
    print("This is homepage");

    final posts =
        await _apiRepo.getForList<List<Posts>, Posts>(endpoint: postsEndPoint);

    if (posts != null) {
      emit(state.copyWith(postList: posts));
    }

    print(state.postList);
  }
}
