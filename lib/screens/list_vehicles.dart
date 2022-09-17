import 'package:figure_collections_maps/model/list_positions.dart';
import 'package:figure_collections_maps/model/position.dart';
import 'package:figure_collections_maps/service/endpoints.dart';
import 'package:figure_collections_maps/widgets/list_item.dart';
import 'package:flutter/material.dart';

class ListVehicles extends StatefulWidget {
  const ListVehicles({Key? key}) : super(key: key);

  @override
  State<ListVehicles> createState() => _ListVehiclesState();
}

class _ListVehiclesState extends State<ListVehicles> {
  ListPositions? listPositions;

  @override
  void initState() {
    super.initState();
    getPositions().then((dataResponse) {
      setState(() {
        listPositions = dataResponse;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Veículos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              Navigator.pushNamed(context, "/mapa", arguments: listPositions);
            },
          ),
        ],
      ),
      //operador ternário
      body: listPositions == null
          ? const LinearProgressIndicator()
          : ListView.separated(
              itemBuilder: (context, index) =>
                  buildListItem(listPositions!.positions[index]),
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: listPositions?.positions.length ?? 0),
    );
  }

  Widget buildListItem(Position position) {
    return ListItemVehicle(position);
  }
}
