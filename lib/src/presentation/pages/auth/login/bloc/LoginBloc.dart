// src/presentation/pages/auth/login/bloc/LoginBloc.dart

import 'package:ecommerce_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState> {
  
  AuthUseCases authUseCases;
  
  LoginBloc(this.authUseCases) : super(LoginState()){
    
    on<InitialEvent>(_onInitialEvent); 
    on<EmailChange>(_onEmailChange); 
    on<PasswordChange>(_onPasswordChange); 
    on<LoginSubmit>(_onLoginSubmit); 
  }

  final formKey=GlobalKey<FormState>();

Future<void> _onInitialEvent(InitialEvent event,Emitter<LoginState> emit) async{
  emit(state.copyWith(formKey: formKey));
}
Future<void> _onEmailChange(EmailChange event,Emitter<LoginState>emit) async{
  emit (
    state.copyWith(
        email: BlocForItem(
        value: event.email.value
        ),
      formKey: formKey
    )
  );

}

Future<void> _onPasswordChange(PasswordChange event,Emitter<LoginState>emit) async{
emit (
    state.copyWith(
        password: BlocForItem(
          value: event.password.value
        ),
      formKey: formKey
    )
  );

}
Future<void> _onLoginSubmit(LoginSubmit event,Emitter<LoginState>emit) async{
 _responseController.add(Loading());
    Resource response= await authUseCases.login.run(state.email.value, state.password.value);
    _responseController.add(response);
    Future.delayed(Duration(seconds: 1),(){
      _responseController.add(Initial());
    });
}


  final _responseController= BehaviorSubject<Resource>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;

  void changeEmail(String email) {
    if (email.isNotEmpty && email.length < 3) {
      _emailController.sink
          .addError('No es un email');
    } else {
      _emailController.sink.add(email);
    }

    _emailController.sink.add(email);
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      _passwordController.sink
          .addError('Al menos 6 caracteres');
    } else {
      _passwordController.sink.add(password);
    }
  }


  Future<void> login() async {
    _responseController.add(Loading());
    Resource response= await authUseCases.login.run(_emailController.value, _passwordController.value);
    _responseController.add(response);
    Future.delayed(Duration(seconds: 1),(){
      _responseController.add(Initial());
    });
    print ('Response: ${response}');
  }

  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void dispose() { // CUANDO PASEMOS A OTRA PANTALLA
    changeEmail('');
    changePassword('');
  }

}
