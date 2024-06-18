import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent, AdminHomeState> {

  AuthUseCases authUseCases;

  AdminHomeBloc(this.authUseCases): super(AdminHomeState()) {
    on<AdminChangeDrawerPage>(_onAdminChangeDrawerPage);
  }

 

  Future<void> _onAdminChangeDrawerPage(AdminChangeDrawerPage event, Emitter<AdminHomeState> emit) async {
    emit(
      state.copyWith(
        pageIndex: event.pageIndex
      )
    );
  }

}