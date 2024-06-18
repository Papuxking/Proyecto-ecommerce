// src/presentation/pages/auth/register/RegisterBlocCubit.dart
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBlocCubit extends Cubit<RegisterBlocState> {
  AuthUseCases authUseCases;
  RegisterBlocCubit(this.authUseCases) : super(RegisterInitial());

  final _nameController = BehaviorSubject<String>();
  final _lastnameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _responseController =BehaviorSubject<Resource>();

  Stream<String> get nameSream => _nameController.stream;
  Stream<String> get lasnameStream => _lastnameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get phoneStream => _phoneController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;


  Stream<bool> get validateForm => Rx.combineLatest6(
      nameSream,
      lasnameStream,
      emailStream,
      phoneStream,
      passwordStream,
      confirmPasswordStream, (a, b, c, d, e, f) => true
      );

  toUser() => User(
 
  name: _nameController.value, 
  lastname: _lastnameController.value, 
  email: _emailController.value, 
  phone: _phoneController.value, 
  password: _passwordController.value,
  notificationToken: 'default_token'

  );

  void register() async{
   _responseController.add(Loading());
    Resource<AuthResponse> response = await authUseCases.register.run(toUser());
    _responseController.add(response);
     Future.delayed(Duration(seconds: 1),(){
      _responseController.add(Initial());
    });
  }

  void changeName(String name) {
    if (name.isNotEmpty && name.length < 2) {
      _nameController.sink.addError('El nombre es muy corto');
    } else {
      _nameController.sink.add(name);
    }
  }

  void changeLastname(String lastname) {
    if (lastname.isNotEmpty && lastname.length < 2) {
      _lastnameController.sink.addError('El apellido es muy corto');
    } else {
      _lastnameController.sink.add(lastname);
    }
  }

  void changeEmail(String email) {
    bool emailFormatValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.isNotEmpty && email.length < 5) {
      _emailController.sink.addError('Al menos 5 caracteres');
    } else if (email.isNotEmpty && !emailFormatValid) {
      _emailController.sink.addError('El email no es valido');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePhone(String phone) {
    if (phone.isNotEmpty && phone.length < 8) {
      _phoneController.sink.addError('No es un número de teléfono válido');
    } else {
      _phoneController.sink.add(phone);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      _passwordController.sink.addError('Al menos 6 caracteres');
    } else {
      _passwordController.sink.add(password);
    }
  }

  void changeConfirmPassword(String confirmPassword) {
    if (confirmPassword.isNotEmpty && confirmPassword.length < 6) {
      _confirmPasswordController.sink.addError('Al menos 6 caracteres');
    } else if (confirmPassword != _passwordController.value) {
      _confirmPasswordController.sink.addError('Las contraseñas no coinciden');
    } else {
      _confirmPasswordController.sink.add(confirmPassword);
    }
  }

  void dispose() {
    changeName('');
    changeLastname('');
    changeEmail('');
    changePhone('');
    changePassword('');
    changeConfirmPassword('');
  }
}
