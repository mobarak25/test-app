import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/ioc/global.dart';
import 'package:test_app/core/navigator/iflutter_navigator.dart';
import 'package:test_app/core/widgets/body.dart';
import 'package:test_app/core/widgets/text.dart';
import 'package:test_app/features/domain/repositories/api_repo.dart';
import 'package:test_app/features/domain/repositories/local_storage_repo.dart';
import 'package:test_app/features/presentation/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Route<dynamic> route() =>
      MaterialPageRoute<dynamic>(builder: (_) => const HomeScreen());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(getIt<IFlutterNavigator>(),
          getIt<ApiRepo>(), getIt<LocalStorageRepo>()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Body(
          isFullScreen: true,
          child: state.postList.isNotEmpty
              ? ListView(
                  padding: const EdgeInsets.all(0),
                  children: List.generate(
                    state.postList.length,
                    (index) => TextB(text: state.postList[index].title!),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
