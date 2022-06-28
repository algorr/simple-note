part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  final String? exception;
  final String? username;

  const HomeInitial({this.exception, this.username});

  @override
  List<Object?> get props => [exception,username];
}

class LoginState extends HomeState {
  final String username;

  const LoginState(this.username);

  @override
  List<Object?> get props => [username];
}

class RegisterState extends HomeState {
  final String username;
  final String password;

  const RegisterState(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class ServiceState extends HomeState {
  const ServiceState();

  @override
  List<Object?> get props => [];
}
