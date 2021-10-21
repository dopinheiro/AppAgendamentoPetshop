import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petshop/pages/homePage.dart';
import 'package:petshop/utils/colors/appGradients.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  BuildContext get context => null;

  void handleTimeout() {
  Navigator.of(context).pushReplacement(new MaterialPageRoute(
    builder: (BuildContext context) => new HomePage()));
}

startTimeout() async {
  var duration = const Duration(seconds: 3);
  return new Timer(duration, handleTimeout);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center( child: Image.asset('assets/images/logo.png'),
        )
      )
    );
  }
}
