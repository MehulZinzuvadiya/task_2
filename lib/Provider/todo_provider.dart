import 'package:flutter/widgets.dart';

import '../Model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> l1 = [];

  void delete(int index) {
    l1.removeAt(index);
    notifyListeners();
  }

  void addData(TodoModel r1) {
    l1.add(r1);
    notifyListeners();
  }

  void updateData(int index, TodoModel r1) {
    l1[index] = r1;
    notifyListeners();
  }
}
