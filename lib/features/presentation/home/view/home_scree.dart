import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/ioc/global.dart';
import 'package:test_app/core/navigator/iflutter_navigator.dart';
import 'package:test_app/core/utils/colors.dart';
import 'package:test_app/core/utils/text_styles.dart';
import 'package:test_app/core/widgets/body.dart';
import 'package:test_app/core/widgets/text.dart';
import 'package:test_app/features/domain/repositories/api_repo.dart';
import 'package:test_app/features/domain/repositories/local_storage_repo.dart';
import 'package:test_app/features/presentation/home/bloc/home_bloc.dart';
import 'package:test_app/features/presentation/home/widgets/repository_card.dart';

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
    final scroll = ScrollController();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        scroll.addListener(() {
          if (scroll.position.pixels == scroll.position.maxScrollExtent) {
            bloc.add(PageIncrement());
          }
        });
        return Body(
          child: state.flutterRepository.items != null
              ? ListView(
                  controller: scroll,
                  padding: const EdgeInsets.all(0),
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    ...List.generate(
                      state.flutterRepository.items!.length,
                      (index) => RepositoryCard(
                        press: () {
                          bloc.add(GoToDetails(
                              details: state.flutterRepository.items![index]));
                        },
                        item: state.flutterRepository.items![index],
                      ),
                    ),
                    if (state.isLoading && !state.isEndList)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    if (!state.isLoading && state.isEndList)
                      const TextB(
                        text: "You reached end of the list",
                        textStyle: bBody1,
                        fontColor: bRed500,
                      ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
