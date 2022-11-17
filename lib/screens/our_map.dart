import 'package:figure_collections_maps/model/persons.dart';
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

  @override
  void initState() {
    super.initState();
    getPositions().then((dataResponse) {
      setState(() {
        listPersons = dataResponse;
        for (var person in listPersons!.persons){
          markers.add(Marker(
            markerId: MarkerId(person.nome),
            position: LatLng(person.lat, person.long),
            infoWindow: InfoWindow(
              title: person.nome,
              snippet: 'Figuras: '+ person.total.toString(),
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
    // String teste = Provider.of<GeneralProvider>(conListPersonsn: false).listCoffe() as String;
    List<Person> persons = Provider.of<GeneralProvider>(context, listen: false).listPersons();

    print("context aqui");
    print(context);
    print(persons[0].repeated);
    print("final aqui");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Figure Collections Maps"),
        actions: [
          IconButton(
            icon: const Icon(Icons.list_alt),
            onPressed: () {
              Navigator.pushNamed(context, "/peoples");
            },
          ),
        ],
      ),
      body: GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: const CameraPosition(
          //innital position in map
          target: showLocation, //initial position
          zoom: 15.0, //initial zoom level
        ),
        markers: markers, //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }

}
