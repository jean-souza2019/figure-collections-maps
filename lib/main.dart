import 'package:figure_collections_maps/screens/list_peoples.dart';
import 'package:figure_collections_maps/screens/list_sticker_people.dart';
import 'package:figure_collections_maps/screens/our_map.dart';
import 'package:figure_collections_maps/screens/chat.dart';
import 'package:figure_collections_maps/screens/signin.dart';
import 'package:figure_collections_maps/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/': (context) => const SignIn(),
        '/peoples': (context) => const ListPeoples(),
        '/sticker': (context) => const ListStickerPeople(),
        '/chat' : (context) => const Chat(),
        '/Mapa': (context) => const Mapa(),
        '/signup': (context) => const SignUp()
      },
    );
  }
}