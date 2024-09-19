import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home.dart';

class Loginscreen extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
      title:Text("LOGIN SCREEN")
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(width: 300,

          child:   TextField(
            controller: emailcontroller,
            decoration: InputDecoration(
              hintText: "Email I'd",
              suffixIcon: Icon(Icons.email),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              )
            ),
          ),),
          Column(
            children: [
              SizedBox(height: 10,),
              SizedBox(width: 300,

             child:  TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              )
              ),],
          ),

        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          login(emailcontroller.toString(), passwordcontroller.toString(),context);
        },child: Text("login")  )]
        ),
      )
    );
  }


login(String email,String password,BuildContext context)async {
  if (email == "" || password == "") {
    log("required fields");
  }

  else {
    SharedPreferences prfs = await SharedPreferences.getInstance();
    prfs.setBool("login", true);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Homescreen()));
  }
}}