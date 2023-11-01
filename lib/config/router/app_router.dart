import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/presentation/screens/screens.dart';

final _publicRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/list-users',
    builder: (context, state) => const ListUsersScreen(),
  ),
  GoRoute(
    path: '/single-user',
    builder: (context, state) => const SingleUserScreen(),
  ),
]);

class SingleUserCubit extends Cubit<GoRouter> {
  SingleUserCubit() : super(_publicRouter);

  void goBack() {
    state.pop();
  }

  void goHome() {
    state.go('/');
  }
}
