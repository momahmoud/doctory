import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/utils/location_helper.dart';

class FindByMapScreen extends StatefulWidget {
  const FindByMapScreen({super.key});

  @override
  State<FindByMapScreen> createState() => _FindByMapScreenState();
}

class _FindByMapScreenState extends State<FindByMapScreen> {
  late GoogleMapController mapController;
  static LatLng? latLng = const LatLng(30.582045824904135, 31.52845243011082);
  final Set<Marker> _markers = {};

  @override
  void initState() {
    currentLocation();
    super.initState();
  }

  void _showMarkerInfoWindow() {
    Future.delayed(const Duration(milliseconds: 500), () {
      for (var marker = 0; marker < _createMarkers().length; marker++) {
        mapController.showMarkerInfoWindow(
            MarkerId(_createMarkers().first.markerId.value));
      }
    });
  }

  void currentLocation() async {
    await LocationHelper.determinePosition().then((value) {
      latLng = LatLng(value.latitude, value.longitude);
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  final initialCameraPosition = CameraPosition(
    target: latLng!,
    zoom: 13.4746,
  );
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      mapType: MapType.terrain,
      initialCameraPosition: initialCameraPosition,
      onMapCreated: (controller) {
        mapController = controller;
        _setCustomMarker();
        _showMarkerInfoWindow();
      },
      markers: _createMarkers(),
      onTap: (argument) {
        print(argument);
      },
    );
  }

  BitmapDescriptor? customIcon;
  void _setCustomMarker() async {
    customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/pngs/doctor-logo.png',
      height: 50.h,
      width: 50.w,
    );

    setState(() {});
  }

  Set<Marker> _createMarkers() {
    return {
      Marker(
          markerId: const MarkerId("doctor_1"),
          position: const LatLng(30.582045824904135, 31.52845243011082),
          icon: customIcon ?? BitmapDescriptor.defaultMarker,
          infoWindow: const InfoWindow(
            title: "Dr. John Doe",
            snippet: "Specialist in Neurology",
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: const EdgeInsets.all(16),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Dr. John Doe",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Specialist in Neurology"),
                    Text("Contact: " "0123456789"),
                  ],
                ),
              ),
            );
          }),
      Marker(
          markerId: const MarkerId("doctor_2"),
          position: const LatLng(30.567243760472756, 31.53080027550459),
          icon: customIcon ?? BitmapDescriptor.defaultMarker,
          infoWindow: const InfoWindow(
            title: "Dr. John Doe 2",
            snippet: "Specialist in Neurology 2",
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: const EdgeInsets.all(16),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Dr. John Doe",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Specialist in Neurology"),
                    Text("Contact: " "0123456789"),
                  ],
                ),
              ),
            );
          })
    };
  }
}
