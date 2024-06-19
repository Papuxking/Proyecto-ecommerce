// src/presentation/pages/auth/login/bloc/LoginEvent.dart
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class InitialEvent extends LoginEvent {
  const InitialEvent();
}

class LoginFormReset extends LoginEvent {
  const LoginFormReset();
}

class LoginSaveUserSession extends LoginEvent {
  final AuthResponse authResponse;
  const LoginSaveUserSession({required this.authResponse});

  @override
  List<Object?> get props => [authResponse];
}

class EmailChange extends LoginEvent {
  final BlocFormItem email;
  const EmailChange({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordChange extends LoginEvent {
  final BlocFormItem password;
  const PasswordChange({required this.password});

  @override
  List<Object?> get props => [password];
}

class LoginSubmit extends LoginEvent {
  const LoginSubmit();
}
