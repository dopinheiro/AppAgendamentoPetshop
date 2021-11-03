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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GridView.count(
              padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
              shrinkWrap: true,
              primary: true,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              // childAspectRatio: MediaQuery.of(context).size.height * 50,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Image.asset('assets/images/chuveiro.png', width: 60),
                    Text("Banho", 
                    style: TextStyle(
                      color: AppColors.brown, 
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,)
                    ),
                  ],),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.yellow,),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Image.asset('assets/images/tesoura.png', width: 60,),
                    Text("Tosa", 
                    style: TextStyle(
                      color: AppColors.brown, 
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,)
                    )
                  ],),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.yellow,),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Image.asset('assets/images/shampoo.png', width: 60,),
                    Text("Hidratação", 
                    style: TextStyle(
                      color: AppColors.brown, 
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,)
                    )
                  ],),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.yellow,),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Image.asset('assets/images/escova.png', width: 60,),
                    Text("Escovação", 
                    style: TextStyle(
                      color: AppColors.brown, 
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      )
                    )
                  ],),
                 decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.yellow,),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Image.asset('assets/images/pente.png', width: 60,),
                    Text("Penteados", 
                    style: TextStyle(
                      color: AppColors.brown, 
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,)
                    )
                  ],),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.yellow,),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Image.asset('assets/images/pata.png', width: 60,),
                    Text("Corte de unhas", 
                    style: TextStyle(
                      color: AppColors.brown, 
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,)
                    )
                  ],),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.yellow,),
                ),

              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.purple),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/navigation');
                 },
                child: Text("Novo Agendamento", 
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
