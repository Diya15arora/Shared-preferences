import 'dart:convert';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Signin"),
            centerTitle: true,
            backgroundColor: Colors.cyanAccent
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 250,
                    child: TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          hintText: "Email",
                          suffixIcon: Icon(Icons.email_outlined),
                          hintStyle: TextStyle(color: Colors.deepPurple
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))
                      ),

                    ),

                  ),
                  SizedBox(height: 10,),

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 250,
                          child: TextField(
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                                hintText: "password",
                                suffixIcon: Icon(Icons.password),
                                hintStyle: TextStyle(color: Colors.deepPurple,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))
                            ),

                          ),

                        ),



                  ]),
                  ),
                  SizedBox(height: 10,),

                  ElevatedButton(onPressed: () {
                    signin(emailcontroller.text.toString(),
                        passwordcontroller.text.toString(),
                    context);
                  }, child: Text("Sign In")),
              ])));
  }

signin(String email,String password, BuildContext context )async{
  if(email==""|| password=="") {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter required's fields"),));
  }
  else{
    final response=await http.post(Uri.parse("https://notes-api-eight-psi.vercel.app/notesapp/signin"),
        body: jsonEncode({
          "email":email,
          "password":password,

        }),headers: {"Content-Type":"application/json"});

    if(response.statusCode==200){

      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body),));

    }
    else {
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.body)));
    }
  }
}
}



