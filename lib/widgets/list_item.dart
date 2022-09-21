import 'package:figure_collections_maps/model/persons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geocoding/geocoding.dart';

class ListItemPerson extends StatefulWidget {
  final Person person;

  const ListItemPerson(this.person, {super.key});

  @override
  State<ListItemPerson> createState() => _ListItemPersonState();
}

class _ListItemPersonState extends State<ListItemPerson> {
  TextStyle style15dp = const TextStyle(fontSize: 15);
  TextStyle style27dp = const TextStyle(fontSize: 27);

  //null safety: late ou ?
  Placemark? placemark;

  @override
  void initState() {
    super.initState();
    getAddress();
  }

  getAddress() async {
    List<Placemark> listPlacemarks = await placemarkFromCoordinates(
        widget.person.lat, widget.person.long);
    setState(() {
      placemark = listPlacemarks[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: doNothing,
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Comandos',
          ),
        ],
      ),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.person.nome.trim(),
                        style: style27dp),
                    Text(
                      placemark == null
                          ? "Buscando endereço..."
                          : getFormattedAddress(),
                      style: style15dp,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, "/mapa", arguments: widget.person); // colocar outra tela
        },
      ),
    );
  }

  String getFormattedAddress() {
    return "${placemark?.subAdministrativeArea}, ${placemark?.administrativeArea}";
  }

  void doNothing(BuildContext context) {}
}
