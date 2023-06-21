import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx2/widget/login.dart';
import 'package:getx2/widget/registration.dart';
import '../screens/Orderscreen.dart';
import '../screens/ProductOverview.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Home"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: () {
              Get.to(() => ProductOverviewPage());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders"),
            onTap: () {
              Get.to(() => OrderScreen());
            },
          ),
            Divider(),
          ListTile(
            leading: Icon(Icons.login),
            title: Text("login"),
            onTap: () {
              Get.to(() => SignUpScreen());
            },
          ),
        ],
      ),
    );
  }
}