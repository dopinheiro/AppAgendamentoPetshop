import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xFFEFEFEF),
                  Color(0xFFF6D9B1),
                  Color(0xFFFFC069)
                ],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Image.asset('assets/images/logo.png'),
        ));
  }
}
