import 'package:figure_collections_maps/model/sticker.dart';
import 'package:figure_collections_maps/providers/GeneralProvider.dart';
import 'package:figure_collections_maps/service/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:figure_collections_maps/model/list_positions.dart';
import 'package:provider/provider.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;
  ListPersons? listPersons;
  final Set<Marker> markers = new Set();
  static const LatLng showLocation = const LatLng(-28.265327, -52.397575);
  late GeneralProvider _generalProvider;
  @override
  void initState() {
    super.initState();
    getPositions().then((dataResponse) {
      setState(() {
        listPersons = dataResponse;
        for (var person in listPersons!.persons) {
          markers.add(Marker(
            markerId: MarkerId(person.nome),
            position: LatLng(person.lat, person.long),
            infoWindow: InfoWindow(
              title: person.nome,
              snippet: 'Figuras: ' + person.total.toString(),
              onTap: () {
                Navigator.pushNamed(context, "/sticker",
                    arguments: StickerArguments(person.nome, person.repeated));
              },
            ),
            icon: BitmapDescriptor.defaultMarker,
          ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _generalProvider = Provider.of<GeneralProvider>(context, listen: false);
    return Consumer<GeneralProvider>(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text(model.titleMaps),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Sair",
                                  style: TextStyle(color: Colors.black)),
                              content: const Text('Realmente deseja sair?',
                                  style: TextStyle(color: Colors.black)),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Não',
                                        style: TextStyle(color: Colors.black))),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/");
                                    },
                                    child: const Text("Sim",
                                        style: TextStyle(color: Colors.black)))
                              ],
                            ));
                  },
                ),
              ],
            ),
            body: Stack(alignment: AlignmentDirectional.topEnd, children: [
              GoogleMap(
                zoomGesturesEnabled: true,
                initialCameraPosition: const CameraPosition(
                  target: showLocation,
                  zoom: 15.0,
                ),
                markers: markers,
                mapType: MapType.normal,
                onMapCreated: (controller) {
                  setState(() {
                    mapController = controller;
                  });
                },
              ),
              Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        _generalProvider.incrementEmail(' - Now');
                        Navigator.pushNamed(context, "/peoples");
                      },
                      child: Icon(Icons.people),
                    ),
                  ))
            ])));
  }
}
