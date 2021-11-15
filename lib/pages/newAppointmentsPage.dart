import 'dart:async';

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appColors.dart';
import 'package:http/http.dart' as http;

class NewAppointmentsPage extends StatefulWidget {
    int appointmentId;
    NewAppointmentsPage(this.appointmentId);

  @override
  _NewAppointmentsPageState createState() => _NewAppointmentsPageState();
}

class _NewAppointmentsPageState extends State<NewAppointmentsPage> {
  Future fetch() async {
    if (newAppointment.id==0) {
      var url = Uri.parse('http://192.168.100.78:5000/api/add-appointment');
      var updatedDateTime = new DateTime(newAppointment.date.year, newAppointment.date.month,
          newAppointment.date.day, selectedTime.hour, selectedTime.minute);
      var response = await http.post(url, body: {
        'date': DateFormat('yyyy-MM-dd kk:mm').format(updatedDateTime),
        'pet': newAppointment.pet.id.toString(),
        'service': newAppointment.services.toString(),
        'note': newAppointment.note
      });
      print('Response status: ${response.body}');
      print(DateFormat('yyyy-MM-dd kk:mm').format(updatedDateTime));
    } else {
        var url = Uri.parse("http://192.168.100.78:5000/api/edit-appointment/${widget.appointmentId}");
        var updatedDateTime = new DateTime(newAppointment.date.year, newAppointment.date.month,
          newAppointment.date.day, selectedTime.hour, selectedTime.minute);
        var response = await http.put(url, body: {
          'id': newAppointment.id.toString(),
          'date': DateFormat('yyyy-MM-dd kk:mm').format(updatedDateTime),
          'pet': newAppointment.pet.id.toString(),
          'service': newAppointment.services.toString(),
          'note': newAppointment.note
        });
        print('Response status: ${response.body}');
        print(DateFormat('yyyy-MM-dd kk:mm').format(updatedDateTime));
    }

    }
    

  Future createAppointment() async {
    if (widget.appointmentId>0) {
      print("http://192.168.100.78:5000/api/get-appointment/${widget.appointmentId}");
      var url = Uri.parse("http://192.168.100.78:5000/api/get-appointments/${widget.appointmentId}");
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      setState( () {

      newAppointment.id = json["id"];
      newAppointment.date = DateTime.parse(json["date"]);
      newAppointment.setPet(json["pet"]);
      newAppointment.note = json["note"];

      for (final item in json["services"]) {
        changeChecks(item['id']);
      }

      selectedTime = TimeOfDay.fromDateTime(newAppointment.date);
    });
    }
  }

    @override
    @mustCallSuper
    // ignore: must_call_super
    void initState() {
      createAppointment();
    }

  DateTime currentDate = DateTime.now();
  TimeOfDay selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        newAppointment.date = pickedDate;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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
    {"id": 1, "name":"Maya"},
    {"id": 2, "name":"Steve"},
  ];

  Appointment newAppointment = Appointment(
    id:0,
    date: DateTime.now(),
    pet: Pet(
      id: 0,
      name: "Selecione um pet",
    ),
    status: Null,
    note: Null
  );
  List<Service> services = [
    Service(id:1,name:"Banho", isChecked:false),
    Service(id:2,name:"Tosa", isChecked:false),
    Service(id:3,name:"Corte de Unhas", isChecked:false),
    Service(id:4,name:"Hidratação", isChecked:false),
    Service(id:5,name:"Penteado", isChecked:false),
    Service(id:6,name:"Escovação de Dentes", isChecked:false),
    Service(id:7,name:"Meu banho", isChecked:false)
  ];

  void changeChecks(int key) {
    setState(() {
      String action;
      for(final service in services){
        if(service.id==key) {
          service.isChecked= !service.isChecked;
          service.isChecked ? action="add" : action="del";
          newAppointment.setServices(key, action);
        };
      };
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
                hintText: DateFormat('dd/MM/yyyy').format(newAppointment.date),
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
                hintText: selectedTime == null ? " Selecione um horário": selectedTime.format(context),
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
                        value: item["id"].toString(),
                        child: Text(
                          item["name"],
                          style: TextStyle(color: AppColors.brown),
                        ),
                      )
                      ],
                    hint: Text(
                      newAppointment.pet.name,
                      style: TextStyle(
                          color: AppColors.brown,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        for (var item in pets) {
                          if (item["id"].toString()==value) {
                            newAppointment.setPet(item);
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
                            key: Key(service.id.toString()),
                            width: 20.0,
                            height: 20.0,
                            child: Material(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                      width: 1.0,
                                      color: service.isChecked
                                          ? AppColors.purple
                                          : AppColors.purple)),
                              color: Colors.transparent,
                              child: InkWell(
                                  onTap: () {
                                    changeChecks(service.id);
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

                      onChanged: (String text) {
                        setState( () {
                          newAppointment.note=text;
                        });
                        print(newAppointment.note);
                      },
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
                      hintText: newAppointment.note !=Null ? newAppointment.note : "Insira sua observação",
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
  List<int> services=[];
  var status;
  var note;

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

  setPet(Map pet) {
    this.pet = Pet.fromJson(pet);
  }

  setServices(int id, String action) {
    if(action=="add") {
      this.services.add(id);
    }
    else if (action=="del") {
      this.services.remove(id);
    }
  }
}

class Pet {
  int id;
  String name;

  Pet({this.id, this.name});

  factory Pet.fromJson(Map json) {
    return Pet(
      id:json['id'],
      name:json['name'],
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