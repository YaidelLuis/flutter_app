import 'package:flutter_app/config/config.dart';
import 'package:get_it/get_it.dart';

import 'blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(ListUsersScreen());
  getIt.registerSingleton(SingleUserCubit());

  getIt.registerSingleton(ThemeCubit());
}
