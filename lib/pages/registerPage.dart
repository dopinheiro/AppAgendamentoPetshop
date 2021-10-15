import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appColors.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 4, left: 40, right: 40),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 120,
                height: 120,
                child: Center(child: Image.asset('assets/images/logo1.png')),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Nome",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.purple
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
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
                      hintText: "Insira seu nome completo",
                      labelStyle: TextStyle(
                        color: AppColors.brown,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Text("E-mail",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.purple
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                      hintText: "seuemail@mail.com",
                      labelStyle: TextStyle(
                        color: AppColors.brown,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Text("Celular",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.purple
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
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
                      hintText: "(xx) xxxxx-xxxx",
                      labelStyle: TextStyle(
                        color: AppColors.brown,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Text("Senha", 
              style: TextStyle(
                fontSize: 20,
                color: AppColors.purple
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    obscuringCharacter: "*",
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
                      hintText: "********",
                      labelStyle: TextStyle(
                        color: AppColors.purple,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
              Text("Repetir senha", 
              style: TextStyle(
                fontSize: 20,
                color: AppColors.purple
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    obscuringCharacter: "*",
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
                      hintText: "********",
                      labelStyle: TextStyle(
                        color: AppColors.purple,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.purple),
                ),
                onPressed: () { },
                child: const Text("CADASTRAR", 
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),),
              ),
            ]
          )
        )
      )
    ); 
  }
}
