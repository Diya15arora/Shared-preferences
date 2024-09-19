import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController usercontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGN UP"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          SizedBox(
            width: 300  ,
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: "EMAIL",
                suffixIcon: Icon(Icons.mail,size: 20,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),


            ),
          ),
          SizedBox(height: 10,),
          Column(children: [
            SizedBox(
              width: 300  ,
              child: TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                    hintText: "PASSWORD",
                    suffixIcon: Icon(Icons.password,size: 20,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),


              ),
            ),
            SizedBox(height: 10,),
            Column(children: [
              SizedBox(
                width: 300  ,
                child: TextField(
                  controller: usercontroller,
                  decoration: InputDecoration(
                      hintText: "USERNAME",
                      suffixIcon: Icon(Icons.person,size: 20,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                signup(emailcontroller.text.toString(), passwordcontroller.text.toString(), usercontroller.text.toString());
              }, child: Text("SUBMIT")
            ),
          ],),
        ],),]),
      ));}
signup(String email,String password,String username)async{
    if(username==""||password==""||username==""){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter required's field"),));
    }
    else{
      final response=await http.post(Uri.parse("https://notes-api-eight-psi.vercel.app/notesapp/signup"),
      body: jsonEncode({
        "email":email,
        "password":password,
        "username":username,

      }),headers: {"Content-Type":"application/json"});
      if(response.statusCode==200){

        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body),));

      }
      else{
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body)));

      };
    }
}
}

