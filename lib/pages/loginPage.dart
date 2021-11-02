import 'package:flutter/material.dart';
import 'package:petshop/utils/colors/appColors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginPage extends StatelessWidget {

  static String tag = '/';

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Center(child: Image.asset('assets/images/logo1.png')),
            ),
            SizedBox(
              height: 20,
            ),
            Text("E-mail",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.purple
            ),),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: SizedBox(
                height: 50,
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
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.envelope, size: 30, color: AppColors.purple,),
                    ),
                    hintText: "seuemail@mail.com",
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
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: SizedBox(
                height: 50,
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
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.eye, size: 30, color: AppColors.purple,),
                    ),
                    hintText: "********",
                    labelStyle: TextStyle(
                      color: AppColors.purple,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.purple),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/navigation');
               },
              child: const Text("ENTRAR", 
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 15),
              child: Text("Esqueceu a senha?", 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.textPrimary
               )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 15),
              child: Row(
                children: [
                  
                  Text("Não tem uma conta? ",
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textPrimary
                     )
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                  },
                  child: new Text(
                    "Cadastre-se",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary
                      ),
                     )
                   )
                  ],
              ),
            ),
            
          ],
        )
      )
    );
  }
}





