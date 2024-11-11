import 'dart:async';

import 'package:ToneLab/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.sizeOf(context).height;
    final sWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 174, 146, 110), // Light brown
              Color.fromARGB(255, 177, 171, 122), // Soft yellow
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //icon image
            Center(
              child: Container(
                width: sWidth * .45,
                height: sHeight * .23,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.yellow.shade700, width: 5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    "assets/appicon1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            //text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //text
                Text(
                  "Tone",
                  style: TextStyle(
                    fontSize: sHeight * .06,
                    color: Colors.brown,
                  ),
                ),
                //text
                Text(
                  "Lab",
                  style: TextStyle(
                    fontSize: sHeight * .06,
                    color: Colors.yellow.shade700,
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
