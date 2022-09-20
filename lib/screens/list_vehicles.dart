import 'package:figure_collections_maps/model/list_positions.dart';
import 'package:figure_collections_maps/model/persons.dart';
import 'package:figure_collections_maps/service/endpoints.dart';
import 'package:figure_collections_maps/widgets/list_item.dart';
import 'package:flutter/material.dart';

class ListVehicles extends StatefulWidget {
  const ListVehicles({Key? key}) : super(key: key);

  @override
  State<ListVehicles> createState() => _ListVehiclesState();
}

class _ListVehiclesState extends State<ListVehicles> {
  ListPersons? listPersons;

  @override
  void initState() {
    super.initState();
    getPositions().then((dataResponse) {
      setState(() {
        listPersons = dataResponse;
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
              Navigator.pushNamed(context, "/mapa", arguments: listPersons);
            },
          ),
        ],
      ),
      //operador ternário
      body: listPersons == null
          ? const LinearProgressIndicator()
          : ListView.separated(
              itemBuilder: (context, index) =>
                  buildListItem(listPersons!.persons[index]),
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: listPersons?.persons.length ?? 0),
    );
  }

  Widget buildListItem(Person position) {
    return ListItemPerson(position);
  }
}
