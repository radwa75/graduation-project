// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sasa/screens/mapsexp.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({Key? key}) : super(key: key);

  @override
  State<profile_screen> createState() => _profile_screenState();
}

// ignore: camel_case_types
class _profile_screenState extends State<profile_screen> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Color mycolor = Color(0xFF090D1B);
    var myheight = MediaQuery.of(context).size.height;
    var mywidth = MediaQuery.of(context).size.width;
    bool _isOn = true;
    final TextEditingController _textController1 = TextEditingController();
    final TextEditingController _textController2 = TextEditingController();
    final TextEditingController _textController3 = TextEditingController();

    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 58.0, left: 20, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 32,
                ),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  MAP2()));
                },
              ),
              SizedBox(
                height: myheight * .03,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Scaffold.of(context).openDrawer();
                      key.currentState?.openDrawer();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          // Specify the image
                          image: AssetImage(
                              'assets/re.png'), //put image from assets here
                          fit: BoxFit.cover, // Fill the container
                        ),
                        borderRadius: BorderRadius.circular(60),
                        // color: Colors.red[400],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mywidth * 0.05,
                  ),
                  Text(
                    'Hey Eman !',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: myheight * .02,
              ),
              Text(
                'Name',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: myheight * .01,
              ),
              TextFormField(
                controller: _textController1,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(),
                  labelText: 'Label here...',
                  labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(212, 153, 151, 151),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: myheight * .01,
              ),
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: myheight * .01,
              ),
              TextFormField(
                controller: _textController2,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Label here...',
                  labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(212, 153, 151, 151),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: myheight * .01,
              ),
              Text(
                'Phone Number',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: myheight * .01,
              ),
              TextFormField(
                controller: _textController3,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Label here...',
                  labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(212, 153, 151, 151),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 45),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              SizedBox(height: 45),
              Text(
                'Social Network',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: myheight * .01,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.indigo[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: mywidth * .03,
                      ),
                      Text(
                        'Connect with Facebook',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: myheight * .02,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(117, 34, 147, 240),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 25,
                        child: Image(
                            image: AssetImage(
                          'assets/google.png',
                        )),
                      ),
                      SizedBox(
                        width: mywidth * .04,
                      ),
                      Text(
                        'Connect with Google',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      ////////////////////////////////////////////////////////////////////////
      drawer: Drawer(
        backgroundColor: Color.fromARGB(244, 255, 255, 255),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 150,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(64, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  /*gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        const Color.fromARGB(232, 255, 255, 255)
                      ],
                    ),*/
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                'ُEdit Personal Info',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                                size: 13,
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
                              // Specify the image
                              image: AssetImage(
                                  'assets/re.png'), //put image from assets here
                              fit: BoxFit.cover, // Fill the container
                            ),
                            borderRadius: BorderRadius.circular(60),
                            // color: Colors.red[400],
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
              onTap: () {
                // Navigate to the home screen or perform any action
                //Navigator.pop(context); // Close the drawer
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
                // Navigate to the home screen or perform any action
                //Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Image.asset("assets/help.png", width: 52, height: 42),
              title: Text(
                'Help',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                // Navigate to the home screen or perform any action
                //Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Image.asset("assets/mass.png", width: 52, height: 45),
              title: Text(
                'Message',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                // Navigate to the home screen or perform any action
                //Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Image.asset("assets/safe.png", width: 50, height: 35),
              title: Text(
                'Safety Center',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                // Navigate to the home screen or perform any action
                //Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Image.asset("assets/set.png", width: 50, height: 35),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                // Navigate to the home screen or perform any action
                //Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
