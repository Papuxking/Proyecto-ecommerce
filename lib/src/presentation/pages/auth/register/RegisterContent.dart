// src/presentation/pages/auth/register/RegisterContent.dart
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/defaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/defaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterContent extends StatelessWidget{

RegisterBlocCubit? bloc;

RegisterContent(this.bloc);

@override
Widget build(BuildContext context){
  return Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/img/fondo.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            color: Color.fromRGBO(0, 0, 0, 0.7),
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 100,
                  ),
                  Text(
                    'REGISTRO',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream: bloc?.nameSream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                              label: 'Nombre',
                              errorText: snapshot.error?.toString(),
                              icon: Icons.person,
                              onChange: (text) {
                                bloc?.changeName(text);
                              });
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream:bloc?.lasnameStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                              label: 'Apellido',
                              errorText: snapshot.error?.toString(),
                              icon: Icons.person,
                              onChange: (text) {
                                bloc?.changeLastname(text);
                              });
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream: bloc?.emailStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                              label: 'Email',
                              icon: Icons.email,
                              errorText: snapshot.error?.toString(),
                              onChange: (text) {
                               bloc?.changeEmail(text);
                              });
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream:bloc?.phoneStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                              label: 'Teléfono',
                              icon: Icons.phone,
                              errorText: snapshot.error?.toString(),
                              onChange: (text) {
                                bloc?.changePhone(text);
                              });
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream: bloc?.passwordStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Contraseña',
                            errorText: snapshot.error?.toString(),
                            icon: Icons.lock,
                            onChange: (text) {
                              bloc?.changePassword(text);
                            },
                            obscureText: true,
                          );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream: bloc?.confirmPasswordStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Confirmar Contraseña',
                            errorText: snapshot.error?.toString(),
                            icon: Icons.lock_outline,
                            onChange: (text) {
                              bloc?.changeConfirmPassword(text);
                            },
                            obscureText: true,
                          );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: StreamBuilder(
                        stream: bloc?.validateForm,
                        builder: (context, snapshot) {
                          return Defaultbutton(
                              text: 'REGISTRARSE',
                              color: snapshot.hasData ? Colors.black : Colors.grey,
                              onPressed: () {
                                if (snapshot.hasData) {
                                 bloc?.register();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'El formulario no es válido',
                                      toastLength: Toast.LENGTH_LONG);
                                      
                                }
                              });
                        }),
                  )
                ],
              ),
            ),
          ),
          Defaulticonback(left: 45, top: 135)
        ],
      );
}
}

