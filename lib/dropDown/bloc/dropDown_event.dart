import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DropDownEvent extends Equatable {
  const DropDownEvent();
}

class DropDownLoadEvent extends DropDownEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
