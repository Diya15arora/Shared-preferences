import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http  ;
class si extends StatefulWidget {
  const si({super.key});

  @override
  State<si> createState() => _siState();
}

class _siState extends State<si> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("signIN"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 300,
            child: TextField(
              controller: emailcontroller,
              decoration:InputDecoration(
                hintText: "EMAIL",
                suffixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),

            ),

            SizedBox(height: 20,),
            Column(
              children: [
                SizedBox(width: 300,
           child:      TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                )
                ),
SizedBox(height: 20,),
                Column(
                  children: [SizedBox(width: 300,
                  child: TextField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                      hintText: "Username",
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),




                  )
                  ],
                )

              ],
            ),

            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              SI( emailcontroller.text.toString(), passwordcontroller.text.toString(), usernamecontroller.text.toString(),context);
            }, child: Text("Signin"))
          ],

        ),
      ),
    );

  }
}
SI(String email,String password,String username,BuildContext context)async{
  if(username==""||password==""||email==""){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter required's fields"),));
  }
else {
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