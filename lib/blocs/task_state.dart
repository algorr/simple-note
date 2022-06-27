part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoadedState extends TaskState {
  final List<Task> tasks;
  final String username;

  TaskLoadedState(this.tasks, this.username);

  @override
  List<Object> get props => [tasks, username];
}

class AddTaskState extends TaskState {
  final String username;

  AddTaskState(this.username);
  @override
  List<Object?> get props => [username];
}

class RemoveTaskState extends TaskState {
  final String username;

  RemoveTaskState(this.username);
  @override
  List<Object?> get props => [username];
}