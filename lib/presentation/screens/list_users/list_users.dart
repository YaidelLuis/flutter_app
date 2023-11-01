import 'package:flutter_app/apis/api_service.dart';
import 'package:flutter_app/models/ListUsers.dart';
import 'package:flutter_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class ListUsersScreen extends StatefulWidget {
  const ListUsersScreen({super.key});

  @override
  State<ListUsersScreen> createState() => _ListUsersScreenState();
}

class _ListUsersScreenState extends State<ListUsersScreen> {
  ApiListUsers api = ApiListUsers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Usuarios'),
      ),
      body: Center(
        child: FutureBuilder(
          future: api.getListUsuarios(),
          builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const MyLoadingWidget();
            } else {
              return ListUsers(snapshot.data!.data);
            }
          },
        ),
      ),
    );
  }
}

// Widget (ListView.builder) para construir la lista de usuarios
class ListUsers extends StatelessWidget {
  final List<User> users;

  const ListUsers(this.users, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${users[index].firstName} ${users[index].lastName}'),
          subtitle: Text(users[index].email),
          trailing: Image.network(
            users[index].avatar,
            width: 50,
          ),
        );
      },
    );
  }
}
