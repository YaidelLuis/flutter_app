import 'package:flutter_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        leading: IconButton(
          icon: themeCubit.state.isDarkmode
              ? const Icon(Icons.light_mode_outlined)
              : const Icon(Icons.dark_mode_outlined),
          onPressed: () {
            themeCubit.toggleTheme();
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.info),
              onPressed: () => _showInfo(context),
            ),
          )
        ],
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(
            title: 'Listado de usuarios',
            subTitle: 'Devuelve un listado de usuarios y sus datos asociados',
            location: '/list-users'),
        _CustomListTile(
            title: 'Usuario Unico',
            subTitle: 'Devuelve los datos de un usuario',
            location: '/single-user'),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}

_showInfo(BuildContext context) {
  return showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    animationType: DialogTransitionType.slideFromTop,
    curve: Curves.fastOutSlowIn,
    duration: const Duration(seconds: 1),
    builder: (BuildContext context) => Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: SizedBox(
        height: 300,
        width: 500,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 50),
                const Text(
                  'Info',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.18,
                      fontSize: 18.0),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Title(
                    color: Colors.black,
                    child: const Text(
                      'Objetivos general de la app:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1,
                          fontSize: 14.0),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Column(
                    children: [
                      ListTile(
                        title: Text(
                          '1- Ejercitar el consumo de APIs y manejo de datos del sitio https://reqres.in/',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              letterSpacing: 0.25),
                        ),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        title: Text(
                          '2- Poner en práctica los conceptos de Clean Code y Clean Arquitecture',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              letterSpacing: 0.25),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
