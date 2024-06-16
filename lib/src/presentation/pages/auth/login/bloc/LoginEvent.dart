// src/presentation/pages/auth/login/bloc/LoginEvent.dart
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();
@override
  List<Object?> get props => [];
} 

class InitialEvent extends LoginEvent{
  const InitialEvent();
}

class EmailChange extends LoginEvent{
  final BlocForItem email;
  const EmailChange({required this.email});

  @override
  List<Object?> get props => [email];

}

class PasswordChange extends LoginEvent{
  final BlocForItem password;
  const PasswordChange({required this.password});

  @override
  List<Object?> get props => [password];

}

class LoginSubmit extends LoginEvent {

  const LoginSubmit();

}
