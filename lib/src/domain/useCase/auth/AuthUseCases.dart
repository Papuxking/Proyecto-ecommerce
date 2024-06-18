// src/domain/useCase/auth/AuthUseCases.dart


import 'package:ecommerce_flutter/src/domain/useCase/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCase/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCase/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCase/auth/SaveUserSessionUseCase.dart';


class AuthUseCases{
  LoginUseCase login;
  RegisterUseCase register;
  SaveUserSessionUseCase saveUserSession;
  GetUserSessionUseCase getUserSession;

  AuthUseCases({
    required this.login,
    required this.register,
    required this.saveUserSession,
    required this.getUserSession,
  });
  }