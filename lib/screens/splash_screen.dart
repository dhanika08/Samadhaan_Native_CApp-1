import 'dart:async';
import 'package:faridabad/main2.dart';
import 'package:faridabad/main3.dart';
import 'package:faridabad/providers/auth.dart';
import 'package:faridabad/screens/base.dart';
import 'package:faridabad/screens/home.dart';
import 'package:faridabad/screens/input_data.dart';
import 'package:faridabad/screens/user_info.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
  void movetoHome() async {
    await Future.delayed(Duration(milliseconds: 2000));
    final result = await Auth().autoLogin();
    if (result == 'google') {
      final check = await Auth().checkuserInfo();
      if (check) {
        Navigator.of(context).pushReplacementNamed(Base.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(UserInfoScreen.routeName);
      }
    }
    else if(result == 'admin') 
    {
      Navigator.of(context).pushReplacementNamed(AdminUi.routeName);
    }
    else {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  void initState() {
    movetoHome();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/samadhaan.png',
                width: MediaQuery.of(context).size.width * .5,
              ),
            ),
          ),
          Text(
            'Samadhaan',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lobster',
              color: Colors.white,
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
