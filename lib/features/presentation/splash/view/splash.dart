import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/ioc/global.dart';
import 'package:test_app/core/navigator/iflutter_navigator.dart';
import 'package:test_app/core/utils/asset_image.dart';
import 'package:test_app/core/utils/colors.dart';
import 'package:test_app/core/utils/text_styles.dart';
import 'package:test_app/core/widgets/body.dart';
import 'package:test_app/core/widgets/text.dart';
import 'package:test_app/features/domain/repositories/local_storage_repo.dart';
import 'package:test_app/features/presentation/splash/bloc/splash_bloc.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          SplashBloc(getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>()),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return Body(
            isFullScreen: true,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0XFF0D47A1),
                          Color(0XFF1976D2),
                          Color(0XFF0D47A1),
                        ]),
                    image: DecorationImage(
                      image: AssetImage(splashBg),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  width: size.width,
                  height: size.height,
                  child: const Center(
                    child: TextB(
                      text: "Splash Screen",
                      textStyle: bHead3,
                      fontColor: bWhite,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
