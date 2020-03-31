import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  _ListStore() {
    autorun((_) {
      print(isFormValid);
    });
  }

  @observable
  String newTodoTile = "";

  @observable
  List<String> todoList = [];

  @computed
  void setNewTodoTile(String newTodo) => newTodo = newTodo;

  @action
  void addTodo() {
    //todoList.add(newTodoTile);
    todoList = List.from(todoList..add(newTodoTile));
    print(todoList);
  }

  @computed
  bool get isFormValid => newTodoTile.isNotEmpty;
}
