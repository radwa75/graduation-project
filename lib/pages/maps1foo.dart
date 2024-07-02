// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:fl_location/fl_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sasa/pages/Divider.dart';

import '../components/constant.dart';

class MAP1 extends StatefulWidget {
  const MAP1({super.key});

  @override
  State<MAP1> createState() => _MAPState();
}

class _MAPState extends State<MAP1> {
  static const LatLng _Googlepixel = LatLng(30.044420, 31.235712);
  static const LatLng _DestinationPixel = LatLng(31.200092, 29.918739);
  LatLng? _currentP;
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _checkAndRequestPermission();
    _listenLocationStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _currentP == null
                ? const Center(
                    child: Text("Loading..."),
                  )
                : GoogleMap(
                    onMapCreated: ((GoogleMapController controller) =>
                        _mapController.complete(controller)),
                    initialCameraPosition: CameraPosition(
                      target: _currentP ?? _Googlepixel,
                      zoom: 13,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _currentP!,
                      ),
                      Marker(
                        markerId: MarkerId("_destionationLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _DestinationPixel,
                      ),
                    },
                    polylines: Set<Polyline>.of(polylines.values),
                  ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 320.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'hiii',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'where to ',
                      style: TextStyle(fontSize: 20, fontFamily: 'Brand-Bold'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 6,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Search Drop off location ")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Icon(Icons.home, color: Colors.grey),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("add home"),
                            SizedBox(
                              height: 4,
                            ),
                            Text("yourliving home address",
                                style: TextStyle(color: Colors.grey))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    DividerWidget(),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.home, color: Colors.grey),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("add work"),
                            SizedBox(
                              height: 4,
                            ),
                            Text("youe work address ",
                                style: TextStyle(color: Colors.grey))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(_currentP!.latitude, _currentP!.longitude),
      PointLatLng(_DestinationPixel.latitude, _DestinationPixel.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      generatePolyLineFromPoints(polylineCoordinates);
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<bool> _checkAndRequestPermission({bool? background}) async {
    if (!await FlLocation.isLocationServicesEnabled) {
      // Location services are disabled.
      return false;
    }

    var locationPermission = await FlLocation.checkLocationPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      // Cannot request runtime permission because location permission is denied forever.
      return false;
    } else if (locationPermission == LocationPermission.denied) {
      // Ask the user for location permission.
      locationPermission = await FlLocation.requestLocationPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) return false;
    }

    // Location permission must always be allowed (LocationPermission.always)
    // to collect location data in the background.
    if (background == true &&
        locationPermission == LocationPermission.whileInUse) return false;

    // Location services has been enabled and permission have been granted.
    return true;
  }

  Future<void> _listenLocationStream() async {
    if (await _checkAndRequestPermission()) {
      FlLocation.getLocationStream()
          .handleError(_handleError)
          .listen((Location event) async {
        setState(() {
          _currentP = LatLng(event.latitude, event.longitude);
          _cameraToPosition(_currentP!);
          
        });
        await getPolylinePoints();
      });
    }
  }

  void _handleError(dynamic error, StackTrace stackTrace) {
    print('error: ${error.toString()}');
  }
}
