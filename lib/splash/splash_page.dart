import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color> [
            Color(0xFFFFC0AD),
            Color(0xFFE78FB3),
            Color(0xFF9656A1)
          ],
          tileMode: TileMode.clamp
        )
      ),
      child: Center(
        child: Image.asset('assets/images/logo.png'),
      )
    );
  }
}