import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sasa/screens/contacts/contactsm.dart';
import 'package:sasa/screens/sms.dart';
import 'package:sasa/widgets/home_widgets/emergency.dart';
import 'package:sasa/widgets/live_safe.dart';
import '../../screens/contacts/db_services.dart';




class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({super.key});
  int qIndex = 0;
  Position? _curentPosition;
  String? _curentAddress;
  LocationPermission? permission;
  _getPermission() async => await [Permission.sms].request();
  _isPermissionGranted() async => await Permission.sms.status.isGranted;
  // _sendSms(String phoneNumber, String message, {int? simSlot}) async {
  //   SmsStatus result = await BackgroundSms.sendMessage(
  //       phoneNumber: phoneNumber, message: message, simSlot: 1);
  //   if (result == SmsStatus.sent) {
  //     print("Sent");
  //     Fluttertoast.showToast(msg: "send");
  //   } else {
  //     Fluttertoast.showToast(msg: "failed");
  //   }
  // }
  String _currentCity = "";
  checkLocationPermission() async {
    bool permissionGranted = await _requestLocationPermission();
    setState(() {
      _locationPermissionGranted = permissionGranted;
    });

    if (_locationPermissionGranted) {
      _getCurrentCity();
    }
  }

  void _getCurrentCity() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        setState(() {
          _currentCity = placemark.locality ?? 'Unknown';
        });
        print(_currentCity);
      }
    } catch (e) {
      print('Error getting current city: $e');
    }
  }

  bool _locationPermissionGranted = false;
  Future<bool> _requestLocationPermission() async {
    var status = await Permission.location.request();
    return status == PermissionStatus.granted;
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('Current Location: $position');
      _getCurrentAddress();
      // Handle the obtained location as needed
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  String currentCity = '';

  _getCurrentAddress() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _curentPosition!.latitude, _curentPosition!.longitude);

      Placemark place = placemarks[0];
      setState(() {
        _curentAddress =
            "${place.locality},${place.postalCode},${place.street},";
        print(_curentAddress);
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  getRandomQuote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(6);
    });
  }

  getAndSendSms() async {
    List<TContact> contactList = await DatabaseHelper().getContactList();

    String messageBody =
        "https://maps.google.com/?daddr=${_curentPosition!.latitude},${_curentPosition!.longitude}";
    if (await _isPermissionGranted()) {
      contactList.forEach((element) {
        // _sendSms("${element.number}", "i am in trouble $messageBody");
      });
    } else {
      Fluttertoast.showToast(msg: "something wrong");
    }
  }

  @override
  void initState() {
    getRandomQuote();
    super.initState();
    _getPermission();
    // _getCurrentLocation();

    ////// shake feature ///

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
             
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.flight_sharp),
                                  backgroundColor: Color.fromARGB(255, 209, 200, 176),
                                ),
                                SizedBox(width: 5),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _locationPermissionGranted == false
                                        ? Text(
                                            "Turn on location services.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text("Location enabled"),
                                    SizedBox(height: 5),
                                    _currentCity.isEmpty
                                        ? Text(
                                            "please enable locations for a better \nexperiences.",
                                            maxLines: 2,
                                            style: TextStyle(),
                                          )
                                        : Text("Current City $_currentCity"),
                                    SizedBox(height: 5),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: _locationPermissionGranted == true
                                          ? SizedBox()
                                          : MaterialButton(
                                              onPressed: () async {
                                                checkLocationPermission();
                                              },
                                              color: Colors.grey.shade100,
                                              shape: StadiumBorder(),
                                              child: Text(
                                                "Enable location",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Incase of emergency dial me",
                           style: GoogleFonts.rem(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 15),
  )),
                      ),
                    ),
                    Emergency(),
                  
                    SizedBox(height: 10),
                    
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Explore LiveSafe",
                         style: GoogleFonts.rem(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 2,fontWeight: FontWeight.bold,fontSize: 15),
  ))),
                    ),
                    SizedBox(height: 10),
                    LiveSafe(),
                    SafeHome(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}