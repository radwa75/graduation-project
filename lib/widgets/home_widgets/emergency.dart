import 'package:flutter/material.dart';

import 'emergencies/AmbulanceEmergency.dart';
import 'emergencies/policeemergency.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     
      height: 180,
      width:300,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceEmergency(),
       
        ],
      ),
    );
  }
}
