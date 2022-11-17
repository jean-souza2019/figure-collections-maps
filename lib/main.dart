import 'package:figure_collections_maps/providers/GeneralProvider.dart';
import 'package:figure_collections_maps/screens/list_peoples.dart';
import 'package:figure_collections_maps/screens/list_sticker_people.dart';
import 'package:figure_collections_maps/screens/our_map.dart';
import 'package:figure_collections_maps/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      initialRoute: '/',
      routes: {
        '/': (_) => ChangeNotifierProvider(
          create: (context) => GeneralProvider(),
          child: const Mapa(),
        ),
        '/peoples': (context) => const ListPeoples(),
        '/sticker': (context) => const ListStickerPeople(),
        '/chat' : (context) => const Chat()
      },
    );
  }
}