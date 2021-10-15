import 'package:flutter/material.dart';
import 'package:petshop/utils/widgets/bottomAppBar.dart';


class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetShop', 
      home: BottomAppbar());
  }
}
