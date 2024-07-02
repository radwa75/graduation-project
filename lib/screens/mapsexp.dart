// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:fl_location/fl_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sasa/screens/account.dart';
import 'package:sasa/screens/chat_screen.dart';
import 'package:sasa/screens/music.dart';
import 'package:sasa/screens/mytrips.dart';
import 'package:sasa/screens/poromotion.dart';
import 'package:sasa/screens/alert_sound.dart';
import 'package:sasa/screens/fav_places.dart';
import 'package:sasa/screens/favourite_place_page.dart';
import 'package:sasa/screens/profile_screen.dart';


import '../components/constant.dart';
import 'blutooth/BackgroundCollectedPage.dart';

import 'blutooth/SelectBondedDevicePage.dart';
import 'contacts/add_contacts.dart';

class MAP2 extends StatefulWidget {
  const MAP2({super.key});

  @override
  State<MAP2> createState() => _MAPState();
}
class _MAPState extends State<MAP2> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static const LatLng _Googlepixel = LatLng(30.044420, 31.235712);
  static const LatLng _DestinationPixel = LatLng(31.200092, 29.918739);
  LatLng? _currentP;
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    _checkAndRequestPermission();
    _listenLocationStream();
    init_getPolyPoints();
  }

  void init_getPolyPoints() async {
    await getPolyPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: scaffoldKey,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    _currentP == null
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
                            polylines: {
                              Polyline(
                                polylineId: const PolylineId("route"),
                                points: polylineCoordinates,
                                color: const Color(0xFF7B61FF),
                                width: 6,
                              ),
                            },
                          ),
                  Positioned(
  top: 80,
  left: 25,
  child: Container(
    
    decoration: BoxDecoration(
      
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: FloatingActionButton(
      onPressed: () {
        scaffoldKey.currentState?.openDrawer();
      },
      child: Icon(Icons.menu),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
  ),
),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(244, 255, 255, 255),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 200,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(64, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Eman Kahled ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                        onTap:  (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  profile_screen()));
            },
                                child: Container(
                                                          height: 20,
                                                          width: 130,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(30),
                                                            gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 255, 255, 254),
                                    Color.fromARGB(255, 214, 213, 212),
                                  ]
                                                            ),
                                                          ),
                                                          child:  Center(child:
                                Text(
                                  'ُEdit Personal Info',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 54, 54, 54),
                                    fontSize: 10,
                                  ),
                                                          ),
                                                          ),
                                                          ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color.fromARGB(255, 54, 54, 54),
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          width: 60,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/re.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Image.asset("assets/car.png", width: 50, height: 45),
              title: Text(
                'My Trips',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
               onTap:  (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  Trips()));
            },
            ),
            ListTile(
              leading: Image.asset("assets/pay.png", width: 50, height: 40),
              title: Text(
                'Payment',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              onTap: () {
               
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  PromotionsScreen())); // Close the drawer
              },
            ),
            ListTile(
              leading: Image.asset("assets/favplace.png", width: 45, height: 42),
              title: Text(
                'Update favourite places',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
              
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => fav_places()));// Close the drawer
              },
            ),
            ListTile(
              leading: Image.asset("assets/mass.png", width: 52, height: 45),
              title: Text(
                'Message',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  ChatScreen()));// Close the drawer
              },
            ),
            ListTile(
              leading: Image.asset("assets/editcontact.jpeg", width: 50, height: 35),
              title: Text(
                'update trust contacts',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap:  (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  AddContactsPage()));
            },
            ),
            ListTile(
              leading: Image.asset("assets/alert.png", width: 50, height: 35),
              title: Text(
                'Change alert tone',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap:  (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  MusicPage()));
            },
            ),
            ListTile(
              leading: Image.asset("assets/set.png", width: 50, height: 35),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap:  (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
                // Close the drawer
              
      ),
   ])) );
  }


  List<LatLng> polylineCoordinates = [];
   Future getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(_currentP!.latitude, _currentP!.longitude),
      PointLatLng(_DestinationPixel.latitude, _DestinationPixel.longitude),
    );if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {
        polylineCoordinates = result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();
      });
    }
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
        await getPolyPoints();
      });
    }
  }

  void _handleError(dynamic error, StackTrace stackTrace) {
    print('error: ${error.toString()}');
  }
}
