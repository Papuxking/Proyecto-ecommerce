import 'package:equatable/equatable.dart';

abstract class RolesEvent extends Equatable {
//Clase abstracta
  const RolesEvent();

  @override
  List<Object?> get props => [];
}

class GetRolesList extends RolesEvent {
  const GetRolesList();
}