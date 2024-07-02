// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sasa/components/bottom_page.dart';
import 'package:sasa/screens/mapsexp.dart';
import '../components/my_button.dart';




class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            
            SizedBox(
              width: 70,
            ),
            Text(
              '',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body:SafeArea(
        child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
            
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [

                    Lottie.asset('assets/Animation - 1710809578107 (1).json',height: 150,width: 200)

                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                const SizedBox(height: 50),
                Container(
                  child: Text(
                    'Username',
                    style: TextStyle(color: Colors.grey),
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(10),
                ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    
                    hintText: 'Enter your Email',
                    contentPadding: EdgeInsets.symmetric(
                      
                      vertical: 20,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 145, 144, 144),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 145, 144, 144),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
                const SizedBox(height: 10),
                Container(
                  child: Text(
                    'Password',
                    style: TextStyle(color: Colors.grey),
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(20),
                ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:
                TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                      horizontal: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:  Color.fromARGB(255, 145, 144, 144),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 145, 144, 144),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                ),),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap:  ()
                    async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                       Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomPage()));
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                ),
           
               const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        
                      },
                      icon: Image.asset(
                        'images/google.png',
                        height: 24,
                      ),
                      label: Text(
                        'Sign in with Google',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Replace with your desired button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0), // Set circular border radius
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton.icon(
  onPressed: () {
    // Handle Facebook button press
  },
  icon: Icon(
    Icons.facebook,
    size: 24,
    color: Colors.white,
  ),
  label: Text(
    'Sign in with Facebook',
    style: TextStyle(color: Colors.white),
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,// Replace with your desired button color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0), // Set circular border radius
    ),
  ),
),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ],
            ),
          ),
        ),
      ),
    ));
  }
}