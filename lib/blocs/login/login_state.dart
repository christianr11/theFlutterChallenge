import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  final User user;
  LoginSuccessState({this.user});
  @override
  List<Object> get props => null;
}

class LoginFailureState extends LoginState {
  final String message;

  LoginFailureState({this.message});
  @override
  List<Object> get props => null;
}
