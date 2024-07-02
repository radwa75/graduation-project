// ignore_for_file: prefer_const_constructors, unused_field, use_super_parameters, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sasa/screens/blutooth/Mainblue.dart';
import 'package:sasa/screens/mapsexp.dart';
import 'package:sasa/screens/splash.dart';
import 'package:sasa/widgets/home_widgets/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  


  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

 
       

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(192, 255, 153, 0),
          title: Row(
            children: [
            
              SizedBox(
                width: 100,
              ),
              Text(
                'title'.tr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 23),
              ),
            ],
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              SettingsTile(
                color: Colors.blue,
                icon: Ionicons.person_circle_outline,
                title: 'Account'.tr,
                onTap: () {
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  MAP2()));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.green,
                icon: Ionicons.bluetooth,
                title: "Bluetooth".tr,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
              ),
             
             
             SizedBox(
                height: 10,
             ),
              
              const SizedBox(
                height: 40,
              ),
              SettingsTile(
                color: Colors.red,
                icon: Ionicons.log_out_outline,
                title: 'Logout'.tr,
                onTap: () {
                          Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  SplashScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
