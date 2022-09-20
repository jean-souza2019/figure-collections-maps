import 'package:figure_collections_maps/screens/list_vehicles.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const ListVehicles(),
        '/mapa': (context) => const Mapa(),
      },
    );
  }
}