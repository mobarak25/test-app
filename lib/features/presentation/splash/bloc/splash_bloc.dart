import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/navigator/iflutter_navigator.dart';
import 'package:test_app/features/domain/repositories/local_storage_repo.dart';
import 'package:test_app/features/presentation/home/view/home_scree.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._iFlutterNavigator, this._localStorageRepo)
      : super(SplashInitial()) {
    on<IsLoggedInCheck>(_isLoggedInCheck);

    add(IsLoggedInCheck());
  }

  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  FutureOr<void> _isLoggedInCheck(
      IsLoggedInCheck event, Emitter<SplashState> emit) {
    Timer(const Duration(seconds: 2), () {
      _iFlutterNavigator.pushReplacement(HomeScreen.route());
    });
  }
}
