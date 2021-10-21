import 'package:flutter/material.dart';
import 'package:petshop/pages/homePage.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetShop', 
      home: HomePage());
  }
}
