import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  LoginBlocCubit() : super(LoginInitial());

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

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

  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void dispose() { // CUANDO PASEMOS A OTRA PANTALLA
    changeEmail('');
    changePassword('');
  }

  void login() {
    print('Email: ${_emailController.value}');
    print('Password: ${_passwordController.value}');
  }
}
