
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sasa/firebase_options.dart';
import 'package:sasa/screens/splash.dart';
import 'package:get/get.dart';
import 'package:sasa/screens/LocaleString%20.dart';
import 'package:sasa/components/bottom_page.dart';
Future<void> main() async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
await Firebase.initializeApp();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      translations: LocaleString(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: BottomPage(),
      //  home: PromotionsScreen(),
    );
  }
}
dialogueBox(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),),);
}



