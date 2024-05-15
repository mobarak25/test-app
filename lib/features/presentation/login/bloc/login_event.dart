part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class PressToLogin extends LoginEvent {
  const PressToLogin(
      {required this.employeeIdFocusNode, required this.passwordFocusNode});
  final FocusNode employeeIdFocusNode;
  final FocusNode passwordFocusNode;
}
