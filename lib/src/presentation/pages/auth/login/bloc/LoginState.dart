// src/presentation/pages/auth/login/bloc/LoginState.dart
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable{

  final BlocForItem email;
  final BlocForItem password;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const LoginState({
    this.email = const BlocForItem(error: 'Ingresa el email'), 
    this.password = const BlocForItem(error: 'Ingresa la contraseña'), 
    this.formKey, 
    this.response
  });

  LoginState copyWith({
    BlocForItem? email,
    BlocForItem? password,
    Resource? response,
    GlobalKey<FormState>? formKey
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
      response: response
    );
  }
  @override
  List<Object?> get props => [email,password,response];
}

