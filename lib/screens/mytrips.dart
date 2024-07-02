import 'package:flutter/material.dart';

class Trips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Rides'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTripContainer(
                image: "assets/map1.jpeg",
                time: 'Today, 10:30 AM',
                destination: 'Fair Lawn',
                provider: 'Wyne',
              ),
              SizedBox(height: 40),
              _buildTripContainer(
                image: "assets/map.jpeg",
                time: 'Today, 10:30 AM',
                destination: 'Fair Lawn',
                provider: 'Wyne',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTripContainer({
   required final String image,
    required String time,
    required String destination,
    required String provider,
  }) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 248, 214, 160), Color.fromARGB(255, 234, 185, 112)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              time,
              style: TextStyle(fontSize: 14.0, color: Colors.white),
            ),
          ),
          SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              width: 180,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            destination,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 5.0),
          Text(
            provider,
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

