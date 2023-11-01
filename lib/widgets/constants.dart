import 'package:flutter/material.dart';

class Constants {
  static String urlBase = 'https://reqres.in';
  static String id = '2';
}

class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 10),
        Text('Loading'),
      ],
    );
  }
}
