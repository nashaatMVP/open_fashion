import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {

    Future.delayed(
      Duration(seconds: 2),
        () => Navigator.push(context, MaterialPageRoute(builder: (c) {
          return Home();
        })),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SvgPicture.asset(
           "assets/logo/logo-bg.svg",
            width: 150,
          ),
      ),

    );
  }
}
