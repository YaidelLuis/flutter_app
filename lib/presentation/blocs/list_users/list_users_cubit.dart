import 'package:bloc/bloc.dart';

class ListUsersScreen extends Cubit<String> {
  ListUsersScreen() : super('no-username') {
    print('UsernameCubit Constructor called');
  }

  void setUsername(String username) {
    emit(username);
  }
}
