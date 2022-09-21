import 'package:figure_collections_maps/screens/list_peoples.dart';
import 'package:figure_collections_maps/screens/list_sticker_people.dart';
import 'package:figure_collections_maps/screens/our_map.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      initialRoute: '/mapa',
      routes: {
        '/': (context) => const ListPeoples(),
        '/mapa': (context) => const Mapa(),
        '/sticker': (context) => const ListStickerPeople(),
      },
    );
  }
}