// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';

import 'package:flutter/material.dart';

class MyRides extends StatefulWidget {
  const MyRides({super.key});

  @override
  State<MyRides> createState() => _MyRidesState();
}

class _MyRidesState extends State<MyRides> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          toolbarHeight: 140,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 23,
                    ),
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 230,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'My Rides',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          /////////////////////////////////////////////
          bottom: TabBar(
              labelColor: Color.fromARGB(255, 248, 181, 79),
              indicatorColor: Color.fromARGB(255, 248, 181, 79),
              indicatorPadding: EdgeInsets.all(1),
              tabs: [
                Tab(
                  text: 'UPCOMING',
                ),
                Tab(
                  text: 'COMPLETED',
                ),
                Tab(
                  text: 'CANCELED',
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
