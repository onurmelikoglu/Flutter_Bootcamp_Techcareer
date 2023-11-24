import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/data/entity/todos.dart';
import 'package:todo_uygulamasi/data/repo/todos_dao_repository.dart';

class SavepageCubit extends Cubit<List<Todos>> {
  SavepageCubit() : super(<Todos>[]);

  var trepo = TodosDaoRepository();

  Future<void> saveTodos(String name) async {
    await trepo.saveTodos(name);
  }
  
}
