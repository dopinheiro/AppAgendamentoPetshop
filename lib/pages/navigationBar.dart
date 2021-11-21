import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petshop/pages/appointmentsPage.dart';
import 'package:petshop/pages/configPage.dart';
import 'package:petshop/pages/homePage.dart';
import 'package:petshop/pages/myPetsPage.dart';
import 'package:petshop/pages/servicesPage.dart';
import 'package:petshop/utils/colors/appColors.dart';

class BottomNavigation extends StatefulWidget {
  
  const BottomNavigation({ Key key }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  final screens = [
    HomePage(),
    MyPetPages(),
    AppointmentsPage(),
    ServicesPage(),
    ConfigPage()
  ];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gray,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: AppColors.brown,
        unselectedFontSize: 12,
        selectedFontSize: 15,
        currentIndex: index,

        onTap: (value) {
          setState(() {
            index = value;
          });
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
        ],
     )
   );
  }
}