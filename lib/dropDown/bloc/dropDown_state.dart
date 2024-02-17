import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

import '../model/model.dart';


@immutable
abstract class DropDownState extends Equatable {}

//data loading state
class DropDownLoadingState extends DropDownState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DropDownLoadedState extends DropDownState {
  DropDownLoadedState(this.users);
  final List<DropDownModel> users;
  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class DropDownErrorState extends DropDownState {
  DropDownErrorState(this.error);
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
