import 'dart:async';

import 'package:beritaku/core/router/router_constant.dart';
import 'package:beritaku/core/utils/app_constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
        context,
        RouterConstant.homeNewsList,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF616161),
      body: Center(
        child: Image.asset(
          AssetsConstant.imgNews,
          height: 250,
        ),
      ),
    );
  }
}
