// src/presentation/pages/auth/register/RegisterResponse.dart
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterResponse extends StatelessWidget {
  
  final RegisterBlocCubit? bloc;

  RegisterResponse(this.bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Resource>(
      stream: bloc?.responseStream,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is Loading) {
          return Center(child: CircularProgressIndicator(color: Colors.blueGrey));
        }

        if (state is Error) {
          Future.delayed(Duration.zero, () {
            Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_LONG,
            );
          });
        } else if (state is Success) {
          Future.delayed(Duration.zero, () {
            Fluttertoast.showToast(
              msg: 'Registro Exitoso',
              toastLength: Toast.LENGTH_LONG,
            );
            // Navegar a otra pantalla o realizar alguna acción
            Navigator.of(context).pushReplacementNamed('/home');
          });
        }

        return Container();
      },
    );
  }
}
