// src/domain/useCase/auth/AuthUseCases.dart


import 'package:ecommerce_flutter/src/domain/useCase/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCase/auth/RegisterUseCase.dart';


class AuthUseCases{
  LoginUseCase login;
  RegisterUseCase register;

  AuthUseCases({
    required this.login,
    required this.register
  });
  }