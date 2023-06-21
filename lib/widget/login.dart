import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getx2/screens/ProductOverview.dart';
import 'package:getx2/widget/registration.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
  late SharedPreferences logindata;
  late bool newuser = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String username, password) async {
    try {
      Response response = await post(
          Uri.parse('http://192.168.29.59:8080/shopping/login.jsp'),
          body: {'username': username, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        String msg = data['msg'];
        String username = data['username'];
        String password = data['password'];
        log("msg===" + msg);
        log("username===" + username);
        log("password===" + password);

        if (msg.contains("success")) {
          logindata.setBool('login', false);
          logindata.setString('username', username);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Login successfully'),
          ));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductOverviewPage()),
          );
        }
      } else {
        print('failed');
      }
    } catch (e) {
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
          context, new MaterialPageRoute(builder: (context) => ProductOverviewPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
          backgroundColor: Colors.purple ,
          automaticallyImplyLeading: false, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(hintText: 'username'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                // log("message")
                login(usernameController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text('Login'),
                ),
              ),
            ),
             Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20,color: Colors.purple),
                  ),
                   onPressed: () {
                    ElevatedButton(
                      child: const Text("retrieve"),
                      onPressed: () {},
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  regscreen()),
                    );
                   }
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
       
        ),
      ),
    );
  }
}
