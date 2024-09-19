import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Splash extends StatefulWidget{
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
 super.initState();
 Timer(Duration(seconds: 2),()async{
   SharedPreferences prfs = await SharedPreferences.getInstance();
   bool? checklogin = prfs.getBool("login");
   if(checklogin!=null){

   }
   else{


   }
 });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:  Center(child: Icon(Icons.person,size: 90,color: Colors.blue,))

    );
  }
}

