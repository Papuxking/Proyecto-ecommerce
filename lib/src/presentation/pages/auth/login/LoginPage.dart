import 'package:ecommerce_flutter/src/presentation/widgets/defaultTextField.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/img/fondo.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 125,
                ),
                Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: DefaultTextField(
                    label: 'Correo electrónico',
                    icon: Icons.email,
                    onChange: (text) {
                      print('Text: ${text}');
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: DefaultTextField(
                    label: 'Contraseña',
                    icon: Icons.lock,
                    onChange: (text) {
                      print('Text: ${text}');
                    },
                    obscureText: true,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  margin:
                      EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text(
                      'INICIAR SESION',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 65,
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(right: 5),
                    ),
                    Text(
                      'No tienes cuenta?',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Container(
                      width: 65,
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 5),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  margin:
                      EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: Text(
                      'REGISTRATE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
