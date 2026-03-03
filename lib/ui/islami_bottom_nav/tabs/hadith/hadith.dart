import 'package:flutter/material.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('Hadith',style: TextStyle(fontSize: 24,color: Colors.white),)),
      ],
    );
  }
}
