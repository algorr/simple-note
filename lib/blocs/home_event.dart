part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoginEvent extends HomeEvent {
  final String username;
  final String password;

  const LoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [];
}

class RegisterEvent extends HomeEvent {
  final String username;
  final String password;

  const RegisterEvent(this.username, this.password);

  @override
  List<Object?> get props => [];
}

class ServiceEvent extends HomeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
