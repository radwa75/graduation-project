// ignore_for_file: camel_case_types, prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class favourite_place_page extends StatelessWidget {
  const favourite_place_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myheight = MediaQuery.of(context).size.height;
    var mywidth = MediaQuery.of(context).size.width;
    final TextEditingController _textController1 = TextEditingController();
    final TextEditingController _textController2 = TextEditingController();

    //final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Key for the Form widget

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            
            SizedBox(
              width: 70,
            ),
            Text(
              'Update Favourite Places',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 207, 146, 0.58),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/home.png'),
                              width: 29,
                              height: 34,
                            ),
                            SizedBox(
                              width: mywidth * .02,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 207, 146, 0.58),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          children: const [
                            Image(
                              image: AssetImage('assets/work.png'),
                              width: 40,
                              height: 50,
                            ),
                            Text(
                              'Work',
                              style: TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 7,),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 207, 146, 0.58),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          children: const [
                            Image(
                              image: AssetImage('assets/locatoin.png'),
                              width: 40,
                              height: 44,
                            ),
                            Text(
                              'Other',
                              style: TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: myheight * .03,
            ),
            Text(
              'Place Name',
              style: TextStyle(color: Colors.grey[700]),
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
              height: myheight * .03,
            ),
            Text(
              'Place Address',
              style: TextStyle(color: Colors.grey[700]),
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
              height: myheight * .03,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                  color: Color.fromARGB(192, 255, 153, 0),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/map.png'),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Pick on Map',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Stack(
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(248, 207, 146, 0.58),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(210),
                      topRight: Radius.circular(210),
                    ),
                  ),
                ),
                Center(
                  child: Image(
                    image: AssetImage('assets/transport.png'),
                    width: 200,
                    height: 200,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(192, 255, 153, 0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Save Place',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
