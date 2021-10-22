import 'package:flutter/material.dart';
import 'package:petshop/pages/add_pet_page.dart';
import 'package:petshop/pages/appointmentsPage.dart';
import 'package:petshop/pages/configPage.dart';
import 'package:petshop/pages/contactPage.dart';
import 'package:petshop/pages/homePage.dart';
import 'package:petshop/pages/loginPage.dart';
import 'package:petshop/pages/myPetsPage.dart';
import 'package:petshop/pages/newAppointmentsPage.dart';
import 'package:petshop/pages/petPage.dart';
import 'package:petshop/pages/profilePage.dart';
import 'package:petshop/pages/registerPage.dart';
import 'package:petshop/pages/servicesPage.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetShop', 
      // home: LoginPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/addpet': (context) => AddPetPage(),
        '/appointments': (context) => AppointmentsPage(),
        '/config': (context) => ConfigPage(),
        '/contact': (context) => ContactPage(),
        '/home': (context) => HomePage(),
        '/mypets': (context) => MyPetPages(),
        '/newappointments': (context) => NewAppointmentsPage(),
        '/pet': (context) => PetPage(),
        '/profile': (context) => ProfilePage(),
        '/services': (context) => ServicesPage()
      },
    );
  }
}
