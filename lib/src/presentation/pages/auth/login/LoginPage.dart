// src/presentation/pages/auth/login/LoginPage.dart
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      child: BlocListener<LoginBloc,LoginState>(
        listener:(context,state) {
          final responseState =state.response;
            if(responseState is Error) {
                  Fluttertoast.showToast(
                  msg: responseState.message,
                  toastLength: Toast.LENGTH_LONG
                  );

            }
            else if (responseState is Success){
              final authResponse = responseState.data as AuthResponse;
              _bloc?.add(LoginFormReset());
              _bloc?.add(LoginSaveUserSession(authResponse: authResponse));
                Fluttertoast.showToast(
                  msg: 'Login Exitoso',
                  toastLength: Toast.LENGTH_LONG
                  );
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp){
                    Navigator.pushNamed(context, 'roles');
                  });
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              final responseState = state.response;
              if (responseState is Loading) {
                return Stack(
                  children: [
                    LoginContent(_bloc, state),
                    Center(child: CircularProgressIndicator())
                  ],
                );
              }
              return LoginContent(_bloc, state);
            }
          )
        ),
     )
    );
  }
}
