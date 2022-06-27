part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class FetchTasksEvent extends TaskEvent {
  final String username;

  const FetchTasksEvent(this.username);

  @override
  List<Object?> get props => [username];
}

class AddTaskEvent extends TaskEvent {
  final String taskText;
  final String username;

  const AddTaskEvent(this.taskText, this.username);

  @override
  List<Object?> get props => [taskText, username];
}

class RemoveTaskEvent extends TaskEvent {
  final String taskText;
  final String username;

  const RemoveTaskEvent(this.taskText, this.username);

  @override
  List<Object?> get props => [taskText, username];
}

class ToggleTaskCompleteEvent extends TaskEvent {
  final String task;
  final String username;

  ToggleTaskCompleteEvent(this.task, this.username);

  @override
  List<Object?> get props => [task, username];
}
