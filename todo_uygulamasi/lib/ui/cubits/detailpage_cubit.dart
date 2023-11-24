import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/data/entity/todos.dart';
import 'package:todo_uygulamasi/data/repo/todos_dao_repository.dart';

class DetailpageCubit extends Cubit<List<Todos>> {
  DetailpageCubit() : super(<Todos>[]);

  var trepo = TodosDaoRepository();

  Future<void> updateTodo(int id, String name) async {
    await trepo.updateTodos(id, name);
  }

}
