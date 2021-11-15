import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appColors.dart';
import 'package:http/http.dart' as http;

class NewAppointmentsPage extends StatefulWidget {
  @override
  _NewAppointmentsPageState createState() => _NewAppointmentsPageState();
}

class _NewAppointmentsPageState extends State<NewAppointmentsPage> {
  Future fetch() async {
    var url = Uri.parse('http://192.168.100.78:5000/api/add-appointment');
    var service = [];
    var updatedDateTime = new DateTime(currentDate.year, currentDate.month,
        currentDate.day, selectedTime.hour, selectedTime.minute);
    print(updatedDateTime);
    _isChecked.forEach((key, value) {
      if (value == true) {
        service.add(key);
      }
    });
    print(service);
    var response = await http.post(url, body: {
      'date': currentDate.toString(),
      'time': selectedTime.toString(),
      'pet': pet,
      'service': service.toString(),
      'note': 'Tanto faz'
    });
    print(currentDate.toString());
    print('Response status: ${response.statusCode}');
    print('Response status: ${response.body}');
  }

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

  var pet={
    "id": 0,
    "name": "Selecione um pet"
  };
  
  var pets = [
    {"id": "1", "name":"Maya"},
    {"id": "2", "name":"Steve"},
  ];

  var _isChecked = {
    '1': false,
    '2': false,
    '3': false,
    '4': false,
    '5': false,
    '6': false,
  };

  List<Service> services = [
    Service(id:1,name:"Banho", isChecked:false),
    Service(id:2,name:"asd", isChecked:false),
    Service(id:3,name:"Baasdasho", isChecked:true),
    Service(id:4,name:"asdfasdf", isChecked:false),
    Service(id:5,name:"Basdfasdf", isChecked:false),
    Service(id:6,name:"Basdfasdf", isChecked:false)
  ];

  void changeChecks(String key) {
    setState(() {
      _isChecked[key] = !_isChecked[key];
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

                    items: [
                      for(final item in pets)
                        DropdownMenuItem<String>(
                        value: item["id"],
                        child: Text(
                          item["name"],
                          style: TextStyle(color: AppColors.brown),
                        ),
                      )
                      ],
                    hint: Text(
                      pet["name"],
                      style: TextStyle(
                          color: AppColors.brown,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        for (var item in pets) {
                          if (item["id"]==value) {
                            pet = item;
                          };
                        };
                      });
                    },
                  ),
                )),
            Text("Serviços",
                style: TextStyle(fontSize: 20, color: AppColors.purple)),
            Container(
                child: Column(
              children: [
                for(final service in services)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Row(
                      children: [
                        SizedBox(
                            key: Key("1"),
                            width: 20.0,
                            height: 20.0,
                            child: Material(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                      width: 1.0,
                                      color: _isChecked["1"]
                                          ? AppColors.purple
                                          : AppColors.purple)),
                              color: Colors.transparent,
                              child: InkWell(
                                  onTap: () {
                                    changeChecks("1");
                                  },
                                  child: Visibility(
                                    visible: service.isChecked,
                                    child: Icon(Icons.check,
                                        color: AppColors.brown, size: 20.0),
                                  )),
                            )),
                        Text(
                          service.name,
                          style: TextStyle(color: AppColors.brown, fontSize: 17),
                        )
                      ],
                    ),
                ),


                // Padding(
                //   padding: const EdgeInsets.only(bottom: 3),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //           key: Key("1"),
                //           width: 20.0,
                //           height: 20.0,
                //           child: Material(
                //             clipBehavior: Clip.antiAlias,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(8.0),
                //                 side: BorderSide(
                //                     width: 1.0,
                //                     color: _isChecked["1"]
                //                         ? AppColors.purple
                //                         : AppColors.purple)),
                //             color: Colors.transparent,
                //             child: InkWell(
                //                 onTap: () {
                //                   changeChecks("1");
                //                 },
                //                 child: Visibility(
                //                   visible: _isChecked["1"],
                //                   child: Icon(Icons.check,
                //                       color: AppColors.brown, size: 20.0),
                //                 )),
                //           )),
                //       Text(
                //         " Banho",
                //         style: TextStyle(color: AppColors.brown, fontSize: 17),
                //       )
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 3),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //           width: 20.0,
                //           height: 20.0,
                //           child: Material(
                //             clipBehavior: Clip.antiAlias,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(8.0),
                //                 side: BorderSide(
                //                     width: 1.0,
                //                     color: _isChecked["2"]
                //                         ? AppColors.purple
                //                         : AppColors.purple)),
                //             color: Colors.transparent,
                //             child: InkWell(
                //                 onTap: () {
                //                   changeChecks("2");
                //                 },
                //                 child: Visibility(
                //                   visible: _isChecked["2"],
                //                   child: Icon(Icons.check,
                //                       color: AppColors.brown, size: 20.0),
                //                 )),
                //           )),
                //       Text(
                //         " Hidratação",
                //         style: TextStyle(color: AppColors.brown, fontSize: 17),
                //       )
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 3),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //           width: 20.0,
                //           height: 20.0,
                //           child: Material(
                //             clipBehavior: Clip.antiAlias,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(8.0),
                //                 side: BorderSide(
                //                     width: 1.0,
                //                     color: _isChecked["3"]
                //                         ? AppColors.purple
                //                         : AppColors.purple)),
                //             color: Colors.transparent,
                //             child: InkWell(
                //                 onTap: () {
                //                   changeChecks("3");
                //                 },
                //                 child: Visibility(
                //                   visible: _isChecked["3"],
                //                   child: Icon(Icons.check,
                //                       color: AppColors.brown, size: 20.0),
                //                 )),
                //           )),
                //       Text(
                //         " Penteado",
                //         style: TextStyle(color: AppColors.brown, fontSize: 17),
                //       )
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 3),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //           width: 20.0,
                //           height: 20.0,
                //           child: Material(
                //             clipBehavior: Clip.antiAlias,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(8.0),
                //                 side: BorderSide(
                //                     width: 1.0,
                //                     color: _isChecked["4"]
                //                         ? AppColors.purple
                //                         : AppColors.purple)),
                //             color: Colors.transparent,
                //             child: InkWell(
                //                 onTap: () {
                //                   changeChecks("4");
                //                 },
                //                 child: Visibility(
                //                   visible: _isChecked["4"],
                //                   child: Icon(Icons.check,
                //                       color: AppColors.brown, size: 20.0),
                //                 )),
                //           )),
                //       Text(
                //         " Tosa",
                //         style: TextStyle(color: AppColors.brown, fontSize: 17),
                //       )
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 3),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //           width: 20.0,
                //           height: 20.0,
                //           child: Material(
                //             clipBehavior: Clip.antiAlias,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(8.0),
                //                 side: BorderSide(
                //                     width: 1.0,
                //                     color: _isChecked["5"]
                //                         ? AppColors.purple
                //                         : AppColors.purple)),
                //             color: Colors.transparent,
                //             child: InkWell(
                //                 onTap: () {
                //                   changeChecks("5");
                //                 },
                //                 child: Visibility(
                //                   visible: _isChecked["5"],
                //                   child: Icon(Icons.check,
                //                       color: AppColors.brown, size: 20.0),
                //                 )),
                //           )),
                //       Text(
                //         " Escovação dos dentes",
                //         style: TextStyle(color: AppColors.brown, fontSize: 17),
                //       )
                //     ],
                //   ),
                // ),
                // Row(
                //   children: [
                //     SizedBox(
                //         width: 20.0,
                //         height: 20.0,
                //         child: Material(
                //           clipBehavior: Clip.antiAlias,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(
                //                   width: 1.0,
                //                   color: _isChecked["6"]
                //                       ? AppColors.purple
                //                       : AppColors.purple)),
                //           color: Colors.transparent,
                //           child: InkWell(
                //               onTap: () {
                //                 changeChecks("6");
                //               },
                //               child: Visibility(
                //                 visible: _isChecked["6"],
                //                 child: Icon(Icons.check,
                //                     color: AppColors.brown, size: 20.0),
                //               )),
                //         )),
                //     Text(
                //       " Corte de unhas",
                //       style: TextStyle(color: AppColors.brown, fontSize: 17),
                //     )
                //   ],
                // ),
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
                    fetch();
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


class Appointment {
  int id;
  DateTime date;
  Pet pet;
  String status;
  String note;

  Appointment({this.id, this.date, this.pet, this.status, this.note} );

  factory Appointment.fromJson(Map json) {
    return Appointment(
      id:json['id'],
      date:json['date'],
      pet:Pet.fromJson(json['pet']),
      status:json['status'],
      note:json['note']
    );
  }
}

class Pet {
  int id;
  String name;
  String proprietary;
  String specie;

  Pet({this.id, this.name,this.proprietary,this.specie});

  factory Pet.fromJson(Map json) {
    return Pet(
      id:json['id'],
      name:json['name'],
      proprietary:json['proprietary'],
      specie:json['specie']
    );
  }
}

class Service {
  int id;
  String name;
  bool isChecked;

  Service({this.id, this.name, this.isChecked});

  factory Service.fromJson(Map json) {
    return Service(
      id:json['id'],
      name:json['name'],
      isChecked:json['isChecked']
    );
  }
}