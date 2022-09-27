part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitialEvent extends HomeEvent {
  final String username;
  final String password;

  const HomeInitialEvent(this.username,this.password);

  @override
  List<Object?> get props => [username,password];
}

class LoginEvent extends HomeEvent {
  final String username;
  final String password;

  const LoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class RegisterEvent extends HomeEvent {
  final String username;
  final String password;

  const RegisterEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class ServiceEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
