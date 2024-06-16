// src/di/AppModule.dart
import 'package:ecommerce_flutter/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCase/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCase/auth/RegisterUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule{

  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository)
  );

}