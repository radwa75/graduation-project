// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sasa/screens/favourite_place_page.dart';

class fav_places extends StatefulWidget {
  const fav_places({super.key});

  @override
  State<fav_places> createState() => _fav_placesState();
}

class _fav_placesState extends State<fav_places> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            
            SizedBox(
              width: 180,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                  MaterialPageRoute(builder: (context) => favourite_place_page()));
                  },
                  icon: const Icon(
                    color: Color.fromARGB(250, 246, 168, 84),
                    Icons.add,
                    size: 29,
                  ),
                ),
                Text(
                  'Add',
                  style: TextStyle(
                      color: Color.fromARGB(250, 246, 168, 84),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'My Favorites',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/home.png'),
                  width: 39,
                  height: 34,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Home',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 23,
                    ),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
            indent: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/work.png'),
                  width: 50,
                  height: 45,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Work',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 23,
                    ),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'OTHER PLACES',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/location2.png'),
                  width: 39,
                  height: 34,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "McDonald's",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "13424 NE 20th St Old Cairo",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 73,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/location2.png'),
                  width: 39,
                  height: 34,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bouchée",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "19844 NE 15St Naser City",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 73,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/location2.png'),
                  width: 39,
                  height: 34,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Zack's",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "NE 12St El-Dpkki, El-Msaha",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 73,
          ),
        ],
      ),
    );
  }
}
