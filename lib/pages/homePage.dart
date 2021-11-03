import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appColors.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150), 
        child: Container(
          width: double.maxFinite,
          height: 130,
          padding: EdgeInsets.fromLTRB(40, 20, 20, 10),
          color: AppColors.ligthYellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
              "Olá, usuário",
              style: TextStyle(
              color: AppColors.brown,
              fontSize: 20
              )),
          Container(
            height: 58,
            width: 58,
            child: Icon(Icons.person, size: 50, color: AppColors.brown,),
          ),
        ],
        ),
        ),),
        body: Container(
          padding: EdgeInsets.fromLTRB(40, 30, 50, 10),
          child: Column(
            children: [
              RichText(
              text: TextSpan(
                text: 'Servicos de ',
                style: TextStyle(color: Colors.brown, fontSize: 20),
                children: <TextSpan>[
                  TextSpan(
                    text: 'alta qualidade ',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  TextSpan(text: 'para o seu pet!'),
                ],
              ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset('assets/images/service.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(AppColors.purple),
                  ),
                  onPressed: () {
                    
                  },
                  child: const Text("Encontrar Servico", 
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),),
                ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
}
