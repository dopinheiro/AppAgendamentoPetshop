import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appGradients.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

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
