import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final  color;
  final String imagePath;
  const SquareTile({
    super.key,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
        
      ),
    );
  }
}
