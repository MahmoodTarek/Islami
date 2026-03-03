import 'package:flutter/material.dart';

class AzkarTab extends StatelessWidget {
  const AzkarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('Azkar',style: TextStyle(fontSize: 24,color: Colors.white),)),
      ],
    );
  }
}
