import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task.dart';
import '../services/task_service.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskService _taskService;

  TaskBloc(this._taskService) : super(TaskInitial()) {
    on<FetchTasksEvent>((event, emit) {
      final tasks = _taskService.fetchTasks(event.username);
      emit(TaskLoadedState(tasks, event.username));
    });

    on<AddTaskEvent>((event, emit) {
      emit(AddTaskState(event.username));
      _taskService.addTask(event.taskText, event.username);
      final tasks = _taskService.fetchTasks(event.username);
      emit(TaskLoadedState(tasks, event.username));

    });

    on<RemoveTaskEvent>((event, emit) {
      emit(RemoveTaskState(event.username));
      _taskService.removeTask();
    });

    on<ToggleTaskCompleteEvent>((event, emit) {

    });
  }
}
