import 'package:flutter_app/models/SingleUser.dart';
import 'package:flutter_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apis/api_service.dart';

class SingleUserScreen extends StatefulWidget {
  const SingleUserScreen({super.key});

  @override
  State<SingleUserScreen> createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  ApiSingleUser api = ApiSingleUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuario Unico'),
      ),
      body: Center(
        child: FutureBuilder(
          future: api.getSingleUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const MyLoadingWidget();
            } else {
              return MyCardWidget(snapshot.data!.data);
            }
          },
        ),
      ),
    );
  }
}

// widget para construir el card
class MyCardWidget extends StatelessWidget {
  final SingleUser user;
  const MyCardWidget(
    this.user, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        //margin: const EdgeInsets.all(15),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(user.avatar),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text('${user.firstName} ${user.lastName}'),
                    Text(user.email),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
