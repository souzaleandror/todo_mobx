import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/todo_store.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newTodoTitle = "";

  @action
  void setNetTodoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

  //@observable
  //List<String> todoList = [];
  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodoList() {
    //todoList.add(newTodoTitle);
    //todoList = List.from(todoList..add(newTodoTitle));
    //todoList.add(TodoStore(newTodoTitle));
    todoList.insert(0, TodoStore(newTodoTitle));
    print(todoList);
    newTodoTitle = "";
  }
}
