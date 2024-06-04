import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/defaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/defaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBlocCubit? _registerBlocCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registerBlocCubit?.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    _registerBlocCubit =
        BlocProvider.of<RegisterBlocCubit>(context, listen: false);

    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
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
                        stream: _registerBlocCubit?.nameSream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                              label: 'Nombre',
                              errorText: snapshot.error?.toString(),
                              icon: Icons.person,
                              onChange: (text) {
                                _registerBlocCubit?.changeName(text);
                              });
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream: _registerBlocCubit?.lasnameStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                              label: 'Apellido',
                              errorText: snapshot.error?.toString(),
                              icon: Icons.person,
                              onChange: (text) {
                                _registerBlocCubit?.changeLastname(text);
                              });
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream: _registerBlocCubit?.emailStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                              label: 'Email',
                              icon: Icons.email,
                              errorText: snapshot.error?.toString(),
                              onChange: (text) {
                                _registerBlocCubit?.changeEmail(text);
                              });
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream: _registerBlocCubit?.phoneStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                              label: 'Teléfono',
                              icon: Icons.phone,
                              errorText: snapshot.error?.toString(),
                              onChange: (text) {
                                _registerBlocCubit?.changePhone(text);
                              });
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream: _registerBlocCubit?.passwordStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Contraseña',
                            errorText: snapshot.error?.toString(),
                            icon: Icons.lock,
                            onChange: (text) {
                              _registerBlocCubit?.changePassword(text);
                            },
                            obscureText: true,
                          );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                        stream: _registerBlocCubit?.confirmPasswordStream,
                        builder: (context, snapshot) {
                          return DefaultTextField(
                            label: 'Confirmar Contraseña',
                            errorText: snapshot.error?.toString(),
                            icon: Icons.lock_outline,
                            onChange: (text) {
                              _registerBlocCubit?.changeConfirmPassword(text);
                            },
                            obscureText: true,
                          );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: StreamBuilder(
                        stream: _registerBlocCubit?.validateForm,
                        builder: (context, snapshot) {
                          return Defaultbutton(
                              text: 'REGISTARSE',
                              color: snapshot.hasData ? Colors.black : Colors.grey,
                              onPressed: () {
                                if (snapshot.hasData) {
                                  _registerBlocCubit?.register();
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
      ),
    ));
  }
}
