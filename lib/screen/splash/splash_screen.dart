import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seru_wizard/core/constants/color_constant.dart';
import 'package:seru_wizard/screen/wizard/wizard_1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WizardScreen1())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                ColorConstants.kGradientColorTop,
                ColorConstants.kGradientColorBottom,
              ],
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/dummy_logo.png',
                  width: 150,
                ),
              ),
              const Positioned(
                  left: 16,
                  right: 16,
                  bottom: 10,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Presented by FM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "2024",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
