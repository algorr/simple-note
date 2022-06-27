import 'package:hive/hive.dart';

import '../models/task.dart';

class TaskService{
  late Box<Task> _box;

  Future<void> init() async{
    Hive.registerAdapter(TaskAdapter());
    _box = await Hive.openBox<Task>('tasks');
  }

  List<Task> fetchTasks(String username){
    final tasks =  _box.values.where((element) => element.user == username).toList();
    return tasks;
  }

  void addTask(String task, String username){
    _box.add(Task(username, task, false));
    print("BAŞARIYLA EKLENDİ + $username");
  }

  void removeTask(){
    _box.deleteFromDisk();
  }
}