import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/ioc/global.dart';
import 'package:test_app/core/navigator/iflutter_navigator.dart';
import 'package:test_app/core/widgets/body.dart';
import 'package:test_app/core/widgets/text.dart';
import 'package:test_app/features/domain/repositories/api_repo.dart';
import 'package:test_app/features/domain/repositories/local_storage_repo.dart';
import 'package:test_app/features/presentation/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Route<dynamic> route() =>
      MaterialPageRoute<dynamic>(builder: (_) => const LoginScreen());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(getIt<IFlutterNavigator>(),
          getIt<ApiRepo>(), getIt<LocalStorageRepo>()),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final top = MediaQuery.of(context).padding.top;
        final bloc = context.read<LoginBloc>();
        return Body(
          isFullScreen: true,
          child: Container(
            padding: EdgeInsets.fromLTRB(15, top, 15, 0),
            decoration: const BoxDecoration(
              color: Color(0XFFF9F9FF),
            ),
            child: const TextB(text: "Login"),
          ),
        );
      },
    );
  }
}
