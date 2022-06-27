import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/authentication_service.dart';
import '../services/task_service.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationService _authenticationService;
  final TaskService _taskService;

  HomeBloc(this._authenticationService, this._taskService)
      : super(const HomeInitial()) {
    on<LoginEvent>((event, emit) async {
      final user = await _authenticationService.authenticateUser(
          event.username, event.password);
      if (user != null) {
        emit(LoginState(user));
      }
      return;
    });

    on<RegisterEvent>((event, emit) async {
      final result = await _authenticationService.createUser(
          event.username, event.password);
      switch (result) {
        case UserCreationResult.success:
          emit(LoginState(event.username));
          print('kayıt başarılı');
          break;
        case UserCreationResult.failure:
          emit(const HomeInitial(exception: 'An exception is throwed!'));
          print('kayıt edilemedi');
          break;
        case UserCreationResult.already_exists:
          emit(const HomeInitial(exception: 'The username already exists!'));
      }
    });

    on<ServiceEvent>((event, emit) async {
      await _authenticationService.init();
      await _taskService.init();
    });
  }
}
