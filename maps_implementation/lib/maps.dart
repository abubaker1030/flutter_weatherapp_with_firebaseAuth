import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List<MarkerId> listMarkerIds = List<MarkerId>.empty(growable: true);
  Marker marker1 = Marker(
      markerId: MarkerId("Current"),
      position: LatLng(31.4620, 73.1486),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      infoWindow: InfoWindow(
          title: "National Textile University", onTap: () {}, snippet: "NTU"));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        circles: Set.from([Circle( circleId: CircleId('currentCircle'),
          center: LatLng(31.4607, 73.1394),
          radius: 1000,
          fillColor: Colors.blue.shade100.withOpacity(0.5),
          strokeColor:  Colors.blue.shade100.withOpacity(0.1),
        ),],),
        mapType: MapType.normal,
        markers: Set<Marker>.of(markers.values),
        initialCameraPosition:
            CameraPosition(target: LatLng(31.4607, 73.1394), zoom: 15),
        onMapCreated: (GoogleMapController controler) {
          _controller.complete(controler);

          MarkerId markerId1 = MarkerId("1");
          MarkerId markerId2 = MarkerId("2");
          MarkerId markerId3 = MarkerId("3");

          listMarkerIds.add(markerId1);
          listMarkerIds.add(markerId2);
          listMarkerIds.add(markerId3);

          Marker marker1 = Marker(
            markerId: markerId1,
            position: LatLng(31.4620, 73.1486),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
            infoWindow: InfoWindow(
                title: "National Textile University",
                onTap: () {},
                snippet: "NTU"),
          );

          Marker marker2 = Marker(
            markerId: markerId2,
            position: LatLng(31.4365, 73.1339),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueViolet),
            infoWindow: InfoWindow(
                title: "XYZ",
                onTap: () {},
                snippet: "xyx"),
          );

          Marker marker3 = Marker(
            markerId: markerId3,
            position: LatLng(31.4383, 73.1319),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueViolet),
            infoWindow: InfoWindow(
                title: "Lyallpur Galleria",
                onTap: () {},
                snippet: "Lyallpur Galleria"),
          );

          setState(() {
            markers[markerId1] = marker1;
            markers[markerId2] = marker2;
            markers[markerId3] = marker3;
          });
        },
      ),
    );
  }
}
