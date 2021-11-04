import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appColors.dart';

class NewAppointmentsPage extends StatefulWidget {
  @override
  _NewAppointmentsPageState createState() => _NewAppointmentsPageState();
}

class _NewAppointmentsPageState extends State<NewAppointmentsPage> {
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
  final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050));
  if (pickedDate != null && pickedDate != currentDate)
    setState(() {
      currentDate = pickedDate;
    });
}

  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.brown),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Agendamento", 
        style: TextStyle(
          color: AppColors.brown,
        
        ),)
        ),
      body: Container(
        padding: EdgeInsets.only(top: 4, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Data",
            style: TextStyle(
                fontSize: 20,
                color: AppColors.purple)),
            TextFormField(
              cursorColor: Color(0xFFFFF2F5),
              onTap: () {
                setState(() {
                  _selectDate(context);
                });
              },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide (color: AppColors.brown,
                        width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: AppColors.purple,
                        width: 1.0,
                      ),
                    ),
                    
                      filled: true,
                      fillColor: Color(0xFFFFF2F5),
                      suffixIcon: Icon(Icons.calendar_today, color: AppColors.purple),
                      hintText: "  Selecione a data",
                      labelStyle: TextStyle(
                        color: AppColors.brown,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text("Horário",
            style: TextStyle(
                fontSize: 20,
                color: AppColors.purple)),
                  TextFormField(
              cursorColor: Color(0xFFFFF2F5),
              onTap: () {
                setState(() {
                  _selectDate(context);
                });
              },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide (color: AppColors.brown,
                        width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: AppColors.purple,
                        width: 1.0,
                      ),
                    ),
                    
                      filled: true,
                      fillColor: Color(0xFFFFF2F5),
                      suffixIcon: Icon(Icons.timer, color: AppColors.purple),
                      hintText: "  Selecione o horário",
                      labelStyle: TextStyle(
                        color: AppColors.brown,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text("Serviços",
            style: TextStyle(
                fontSize: 20,
                color: AppColors.purple)),
            // add serviços aqui
            Container(
              child: Column(children: [
                Text("Observações",
                style: TextStyle(
                  color: AppColors.brown,
                  fontSize: 20
                ),)
              // add caixa de obs
              ],
              ),),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.purple),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/navigation');
               },
              child: const Text("Salvar", 
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),),
            ),
          ],
          
        ),
      ) ,
    );
  }
}