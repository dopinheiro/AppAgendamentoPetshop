import 'package:flutter/material.dart';
import 'package:petshop/pages/loginPage.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetShop', 
      home: LoginPage());
  }
}
