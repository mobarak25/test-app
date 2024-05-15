// coverage:ignore-file
import 'package:get_it/get_it.dart';
import 'package:test_app/core/ioc/global.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
