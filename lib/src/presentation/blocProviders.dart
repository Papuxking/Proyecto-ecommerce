// src/presentation/blocProviders.dart
import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUseCases>())..add(InitialEvent())),
  BlocProvider<RegisterBlocCubit>(create: (context) => RegisterBlocCubit(locator<AuthUseCases>())),
];