import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonEvent extends LoginEvent {
  final String email, password;

  LoginButtonEvent({this.email, this.password});

  @override
  List<Object> get props => null;
}
