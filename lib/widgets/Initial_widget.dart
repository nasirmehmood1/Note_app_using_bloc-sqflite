import 'package:flutter/material.dart';

class InitialWidegts extends StatelessWidget {
  const InitialWidegts({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.9,
      width: width * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.blueAccent.shade100),
      child: const Text(
        'NO Data',
        style: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}
