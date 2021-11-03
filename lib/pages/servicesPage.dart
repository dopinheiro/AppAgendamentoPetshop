import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appColors.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            GridView.count(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              primary: true,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: <Widget>[
                Container(
                  child: Column(children: [
                    
                  ],),
                  color: AppColors.yellow
                  
                ),
                Container(
                  child: Column(children: [
                    
                  ],),
                  color: AppColors.yellow,
                ),
                Container(
                  child: Column(children: [
                    
                  ],),
                  color: AppColors.yellow,
                ),
                Container(
                  child: Column(children: [
                    
                  ],),
                  color: AppColors.yellow,
                ),

              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.purple),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/navigation');
               },
              child: const Text("Novo Agendamento", 
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
