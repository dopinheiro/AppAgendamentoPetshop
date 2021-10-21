import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petshop/utils/colors/appColors.dart';

class BottomAppbar extends StatefulWidget {

  @override
  _BottomAppbarState createState() => _BottomAppbarState();
}

class _BottomAppbarState extends State<BottomAppbar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gray,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: AppColors.brown,
        unselectedFontSize: 12,
        selectedFontSize: 15,
        currentIndex: _currentIndex,
        
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },

        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home, size: 30),
            label: "Início", ),

          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.paw, size: 30),
            label: "Pets"),

          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calendar, size: 30),
            label: "Agenda"),
          
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.briefcase, size: 30),
            label: "Serviços"),
          
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cog, size: 30),
            label: "Config"),
        ],),
    );
  }
}
       


       