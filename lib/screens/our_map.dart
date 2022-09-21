import 'package:figure_collections_maps/model/sticker.dart';
import 'package:figure_collections_maps/service/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:figure_collections_maps/model/list_positions.dart';
import 'package:figure_collections_maps/model/persons.dart';

class Mapa extends StatefulWidget{
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
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
      ),
      body: GoogleMap( //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: const CameraPosition( //innital position in map
          target: showLocation, //initial position
          zoom: 15.0, //initial zoom level
        ),
        markers: getmarkers(), //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (controller) { //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }

  Set<Marker> getmarkers() {

    setState(() {
      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(-28.267197, -52.417154),
        infoWindow: InfoWindow(
          title: 'Alysson Drews',
          snippet: 'Figuras: 626',
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(-28.270281, -52.387794),
        infoWindow: InfoWindow(
          title: 'Jean Marcos',
          snippet: 'Figuras: 584',
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(-28.265296, -52.397534),
        infoWindow: InfoWindow(
          title: 'Ricardo Ogliari',
          snippet: 'Figuras: 489',
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(-28.265844, -52.398398),
        infoWindow: InfoWindow(
          title: 'José Henrique',
          snippet: 'Figuras: 247',
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(-28.261975, -52.399054),
        infoWindow: InfoWindow(
          title: 'Diego Souza',
          snippet: 'Figuras: 320',
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(-28.287194, -52.366178),
        infoWindow: InfoWindow(
          title: 'Jorge Neuman',
          snippet: 'Figuras: 437',
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(-28.261585, -52.425827),
        infoWindow: InfoWindow(
          title: 'Yuri Alberto',
          snippet: 'Figuras: 120',
          onTap: () {
            Navigator.pushNamed(context, "/sticker", arguments: StickerArguments("Yuri Alberto", [
              "BEL12",
              "BEL15",
              "CAN5",
              "MAR3",
              "BRA1",
              "BRA9",
              "SUI1",
              "SUI11",
              "SUI18",
              "CMR8"
            ] ));
          },
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

    });

    return markers;
  }
}