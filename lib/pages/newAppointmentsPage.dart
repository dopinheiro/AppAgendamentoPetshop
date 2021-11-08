import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appColors.dart';

class NewAppointmentsPage extends StatefulWidget {
  @override
  _NewAppointmentsPageState createState() => _NewAppointmentsPageState();
}

class _NewAppointmentsPageState extends State<NewAppointmentsPage> {
  DateTime currentDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

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

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
      });
  }

  // bool _isChecked = false;
  // void checkBox() {
  //   setState(() {
  //     _isChecked = !_isChecked;
  //   });
  // }

//  var _isChecked = Map();
 var _isChecked = {
    'banho': false,
    'hidratacao': false,
    'penteado': false,
    'tosa': false,
    'escovacao': false,
    'corte_unha': false,
  };
  void changeChecks(String key){
    setState(() {
    _isChecked[key]= !_isChecked[key];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.brown),
          backgroundColor: AppColors.gray,
          centerTitle: true,
          title: Text(
            "Agendamento",
            style: TextStyle(
              color: AppColors.brown,
            ),
          )),
      body: Container(
        padding: EdgeInsets.only(top: 4, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Data",
                style: TextStyle(fontSize: 20, color: AppColors.purple)),
            TextFormField(
              cursorColor: Color(0xFFFFF2F5),
              onTap: () {
                setState(() {
                  _selectDate(context);
                });
              },
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColors.brown, width: 2.0),
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
                style: TextStyle(fontSize: 20, color: AppColors.purple)),
            TextFormField(
              cursorColor: Color(0xFFFFF2F5),
              onTap: () {
                setState(() {
                  _selectTime(context);
                });
              },
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColors.brown, width: 2.0),
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
            Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFFFF2F5),
                    border: Border.all(color: AppColors.purple)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: AppColors.purple,
                    items: <String>[
                      'Luna',
                      'Steve',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: AppColors.brown),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Selecione um pet",
                      style: TextStyle(
                          color: AppColors.brown,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {});
                    },
                  ),
                )),
            Text("Serviços",
                style: TextStyle(fontSize: 20, color: AppColors.purple)),
            Container(
              child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: [
                      SizedBox(
                          key: Key("banho"),
                          width: 20.0,
                          height: 20.0,
                          child: Material(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    width: 1.0,
                                    color: _isChecked["banho"]
                                        ? AppColors.purple
                                        : AppColors.purple)),
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: (){ changeChecks("banho"); },
                                child: Visibility(
                                  visible: _isChecked["banho"],
                                  child: Icon(Icons.check,
                                      color: AppColors.brown, size: 20.0),
                                )),
                          )),
                      Text(
                        " Banho",
                        style: TextStyle(color: AppColors.brown, fontSize: 17),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: Material(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    width: 1.0,
                                    color: _isChecked["hidratacao"]
                                        ? AppColors.purple
                                        : AppColors.purple)),
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: (){ changeChecks("hidratacao"); },
                                child: Visibility(
                                  visible: _isChecked["hidratacao"],
                                  child: Icon(Icons.check,
                                      color: AppColors.brown, size: 20.0),
                                )),
                          )),
                      Text(
                        " Hidratação",
                        style: TextStyle(color: AppColors.brown, fontSize: 17),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: Material(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    width: 1.0,
                                    color: _isChecked["penteado"]
                                        ? AppColors.purple
                                        : AppColors.purple)),
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: (){ changeChecks("penteado"); },
                                child: Visibility(
                                  visible: _isChecked["penteado"],
                                  child: Icon(Icons.check,
                                      color: AppColors.brown, size: 20.0),
                                )),
                          )),
                      Text(
                        " Penteado",
                        style: TextStyle(color: AppColors.brown, fontSize: 17),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: Material(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    width: 1.0,
                                    color: _isChecked["tosa"]
                                        ? AppColors.purple
                                        : AppColors.purple)),
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: (){ changeChecks("tosa"); },
                                child: Visibility(
                                  visible: _isChecked["tosa"],
                                  child: Icon(Icons.check,
                                      color: AppColors.brown, size: 20.0),
                                )),
                          )),
                      Text(
                        " Tosa",
                        style: TextStyle(color: AppColors.brown, fontSize: 17),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: Material(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    width: 1.0,
                                    color: _isChecked["escovacao"]
                                        ? AppColors.purple
                                        : AppColors.purple)),
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: (){ changeChecks("escovacao"); },
                                child: Visibility(
                                  visible: _isChecked["escovacao"],
                                  child: Icon(Icons.check,
                                      color: AppColors.brown, size: 20.0),
                                )),
                          )),
                      Text(
                        " Escovação dos dentes",
                        style: TextStyle(color: AppColors.brown, fontSize: 17),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                  width: 1.0,
                                  color: _isChecked["corte_unha"]
                                      ? AppColors.purple
                                      : AppColors.purple)),
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: (){ changeChecks("corte_unha");}, 
                              child: Visibility(
                                visible: _isChecked["corte_unha"],
                                child: Icon(Icons.check,
                                    color: AppColors.brown, size: 20.0),
                              )),
                        )),
                    Text(
                      " Corte de unhas",
                      style: TextStyle(color: AppColors.brown, fontSize: 17),
                    )
                  ],
                ),
              ],
            )),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Observações",
                    style: TextStyle(color: AppColors.purple, fontSize: 20),
                  ),
                  TextField(
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                    BorderSide(color: AppColors.brown, width: 2.0),
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
                      hintText: "Insira sua observação",
                      labelStyle: TextStyle(
                        color: AppColors.brown,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.purple),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/navigation');
                  },
                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
