import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterspacex/core/model/Landpad/landpad.dart';
import 'package:flutterspacex/core/model/Launchpad/launchpad.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget{
  final List<Launchpad> listLaunchpad;
  final List<Landpad> listLandpad;

  const Maps({Key? key,required this.listLaunchpad,required this.listLandpad}): super(key: key);

  @override
  State<StatefulWidget> createState() => _Maps();

}

class _Maps extends State<Maps>{
  final Completer<GoogleMapController> _controller = Completer();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 2.5,
  );

  @override
  void initState() {
    for(var launchpad in widget.listLaunchpad){
      MarkerId markerId = MarkerId(launchpad.id);
      Marker marker = Marker(
          markerId: markerId,
          position:  LatLng(
              launchpad.latitude,
              launchpad.longitude
          ),
          infoWindow: InfoWindow(title: launchpad.name)
      );
      markers[markerId] = marker;
    }
    for(var landpad in widget.listLandpad){
      MarkerId markerId = MarkerId(landpad.id);
      Marker marker = Marker(
          markerId: markerId,
          position: LatLng(
            landpad.latitude,
            landpad.longitude
          ),
          infoWindow: InfoWindow(title: landpad.name)
      );
      markers[markerId] = marker;
    }


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }
}

