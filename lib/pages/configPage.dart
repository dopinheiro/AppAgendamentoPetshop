import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appColors.dart';
class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Text("Configurações",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.brown,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                color: AppColors.ligthYellow,
                borderRadius: BorderRadius.circular(10) ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Perfil", 
                            style: TextStyle(
                              color: AppColors.brown, 
                              fontSize: 20, 
                              fontWeight: FontWeight.bold)),
                          Icon(Icons.edit)
                        ],
                      ),
                      Text("Editar dados pessoais", 
                        style: TextStyle(
                          color: AppColors.brown,
                          fontSize: 15
                        ),)
                    ]
                  ),
                )
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                color: AppColors.ligthYellow,
                borderRadius: BorderRadius.circular(10) ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Senha", 
                            style: TextStyle(
                              color: AppColors.brown, 
                              fontSize: 20, 
                              fontWeight: FontWeight.bold)),
                          Icon(Icons.edit)
                        ],
                      ),
                      Text("Alterar senha", 
                        style: TextStyle(
                          color: AppColors.brown,
                          fontSize: 15
                        ),)
                    ]
                  ),
                )
              ),
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                color: AppColors.ligthYellow,
                borderRadius: BorderRadius.circular(10) ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Contato", 
                            style: TextStyle(
                              color: AppColors.brown, 
                              fontSize: 20, 
                              fontWeight: FontWeight.bold)),
                              Icon(Icons.menu_book_rounded, color: AppColors.brown,)
                        ],
                      ),
                      Text("Informações de contato", 
                        style: TextStyle(
                          color: AppColors.brown,
                          fontSize: 15
                        ),),
                    ]
                  ),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(10) ),
                child: GestureDetector(
                  onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  "Sair",
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.brown
                ),
                ),
              ),
        ),
            )
      ],),
      )
    );
  }
}
