part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.forms = Forms.initial,
    this.loading = false,
  });

  final Forms forms;
  final bool loading;

  LoginState copyWith({
    Forms? forms,
    bool? loading,
  }) {
    return LoginState(
      forms: forms ?? this.forms,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [forms, loading];
}

final class LoginInitial extends LoginState {}
