import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/navigator/iflutter_navigator.dart';
import 'package:test_app/core/utils/enums.dart';
import 'package:test_app/features/domain/repositories/api_repo.dart';
import 'package:test_app/features/domain/repositories/local_storage_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._iFlutterNavigator, this._apiRepo, this._localStorageRepo)
      : super(LoginInitial()) {
    on<PressToLogin>(_pressToLogin);
  }

  final IFlutterNavigator _iFlutterNavigator;
  final ApiRepo _apiRepo;
  final LocalStorageRepo _localStorageRepo;

  FutureOr<void> _pressToLogin(
      PressToLogin event, Emitter<LoginState> emit) async {
    // if (isValid(event) && !state.loading) {
    //   emit(state.copyWith(loading: true));
    //   final loginResponse = await _apiRepo.post<LoginResponse>(
    //     endpoint: login,
    //   );
    //   if (loginResponse != null) {
    //     await _localStorageRepo.write(
    //         key: tokenDB, value: loginResponse.data!.token!);
    //   }
    //   emit(state.copyWith(loading: false));
    // } else {
    //   emit(state.copyWith(forms: Forms.invalid));
    // }
  }

  // bool isValid(PressToLogin event) {
  //   final validate = Validator.isValidated(items: [
  //     FormItem(text: state.employeeId, focusNode: event.employeeIdFocusNode),
  //     FormItem(text: state.password, focusNode: event.passwordFocusNode),
  //   ], navigator: _iFlutterNavigator);

  //   if (!validate) return false;
  //   if (state.employeeId.isEmpty || state.password.isEmpty) {
  //     return false;
  //   }
  //   return true;
  // }
}
