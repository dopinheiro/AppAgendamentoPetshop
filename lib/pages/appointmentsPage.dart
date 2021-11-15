import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appColors.dart';
import 'package:http/http.dart' as http;

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  List cardValues=[];
  Future getApointments() async {
    var url = Uri.parse('http://192.168.100.67:5000/api/get-appointments/');
    var response = await http.get(url);
    var json = jsonDecode(response.body);

    setState(() {
      cardValues = json['appointments'];
    });
  }

  @override
  @mustCallSuper
  // ignore: must_call_super
  void initState() {
    
    getApointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text(
                "Agendamentos",
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.brown,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if(cardValues.length>0)
            for(final card in cardValues) 
              Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.ligthYellow,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  child:
                  Row(
                  children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Icon(Icons.calendar_today, color: AppColors.brown),
                  Icon(Icons.timer, color: AppColors.brown)
                ],),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                      Text(card['pet']['name'], 
                      style: TextStyle(
                        color: AppColors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                      Text("  15:00",
                      style: TextStyle(
                        color: AppColors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),)
                ],),
                  ),
                  ],)),
              
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Icon(Icons.delete_forever, color: AppColors.brown),
                  Icon(Icons.edit, color: AppColors.brown)
                ],),
                  ]
              ),
          ),

          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.purple),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/newappointments');
              // fetch();
            },
            child: const Text(
              "Novo Agendamento",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class CardValue {
  final int id;
  final String date;
  final String petName;
  final String status;

  CardValue(this.id, this.date, this.petName, this.status);
}
