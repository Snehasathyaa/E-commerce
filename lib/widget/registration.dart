import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:getx2/screens/ProductOverview.dart';
import 'package:getx2/widget/login.dart';

import 'package:http/http.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class regscreen extends StatefulWidget {
 //const SignUpScreen(setBool, {Key? key}) : super(key: key);
  
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<regscreen> {
  
  late SharedPreferences logindata;
  late bool newuser = true;

  TextEditingController NameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String Name , phone, email ,username,password) async {
    
    try{
      
Response response = await post(
        Uri.parse('http://192.168.29.59:8080/shopping/register.jsp'),
        body: {
          'Name' : Name,
          'phone' : phone,
          'email' : email,
          'username' : username,
          'password' : password
        }
      );

      if(response.statusCode == 200){
        
        var data = jsonDecode(response.body.toString());
String msg=data['msg'];

log("msg==="+msg);
log("username==="+Name);
log("phone==="+phone);
log("email==="+email);
log("username==="+username);
log("password==="+password);

        if(msg.contains("success")){

                                                 
 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Register successfully'),
    ));


    
          log("usernqame inside success=="+username);
          
   logindata.setBool('login', false);
          logindata.setString('username', username);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>ProductOverviewPage()),
  );
        }

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }


   @override
  initState() {
    super.initState();
  check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => SignUpScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTER'),
        backgroundColor: Colors.purple  

      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        
        child:ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: NameController,
              decoration: InputDecoration(
                hintText: 'Name'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller:phoneController,
              decoration: InputDecoration(
                hintText: 'phone'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'username'
              ),
            ),
            SizedBox(height: 20,),

            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                
                  log("message");
               login(NameController.text.toString(), phoneController.text.toString(),emailController.text.toString(),usernameController.text.toString(),passwordController.text.toString(),);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Register'),),
              ),


            ),
              
          ]
        ),
      ),
    );
  }
}