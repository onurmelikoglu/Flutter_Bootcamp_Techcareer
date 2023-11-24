import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/data/entity/todos.dart';
import 'package:todo_uygulamasi/data/repo/todos_dao_repository.dart';

class HomepageCubit extends Cubit<List<Todos>> {
  HomepageCubit() : super(<Todos>[]);

  var trepo = TodosDaoRepository();

  Future<void> getTodos() async {
    var list = await trepo.getTodos();
    emit(list);
  }

  Future<void> searchTodo(String searchWord) async {
    var liste = await trepo.searchTodo(searchWord);
    emit(liste);
  }

  Future<void> deleteTodo(int id) async {
    await trepo.deleteTodo(id);
    getTodos();
  }
}
