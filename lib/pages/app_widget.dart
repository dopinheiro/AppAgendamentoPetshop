import 'package:flutter/material.dart';
import 'package:petshop/pages/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'PetShop', home: SplashPage());
  }
}
