import 'package:flutter_app/models/ListUsers.dart' as listuser;
import 'package:flutter_app/models/SingleUser.dart' as singleuser;
import 'package:flutter_app/widgets/constants.dart';
import 'package:http/http.dart' as http;

// consumiendo api para devolver listado de usuario
class ApiListUsers {
  final String urlListUsers = '${Constants.urlBase}/api/users?page=2';

  Future<listuser.Response> getListUsuarios() async {
    final resp = await http.get(Uri.parse(urlListUsers));
    return listuser.responseFromJson(resp.body);
  }
}

// consumiendo api para devolver usuario unico
class ApiSingleUser {
  final String urlSingleUser = '${Constants.urlBase}/api/users/2';

  Future<singleuser.Response> getSingleUser() async {
    final resp = await http.get(Uri.parse(urlSingleUser));
    return singleuser.responseFromJson(resp.body);
  }
}
