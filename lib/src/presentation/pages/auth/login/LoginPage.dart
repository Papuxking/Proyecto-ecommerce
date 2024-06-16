// src/presentation/pages/auth/login/LoginPage.dart
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc;

  @override
  void initState() { // EJECUTA UNA SOLA VEZ CUANDO CARGA LA PANTALLA
    super.initState();
    //WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //  _bloc?.dispose();
    //});
   
  }

  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      body: Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          LoginResponse(_bloc),
          LoginContent(_bloc)

        ],    
      ),
     )
    );
  }
}
