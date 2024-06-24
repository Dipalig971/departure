import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    return const Scaffold(
      backgroundColor: Color(0xffCFE7CF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Ratnavali ke Dohe',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 5,),
          Text('Meaning of All Dohe',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),
        ],
      ),
    );
  }
}
