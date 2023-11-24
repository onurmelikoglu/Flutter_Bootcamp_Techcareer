import 'package:todo_uygulamasi/data/entity/todos.dart';
import 'package:todo_uygulamasi/sqlite/database_connection.dart';

class TodosDaoRepository {
  Future<void> saveTodos(String name) async {
    var db = await DatabaseConnection.databaseAccess();

    var newTodo = Map<String, dynamic>();
    newTodo["name"] = name;

    await db.insert("todos", newTodo);
  }

  Future<void> updateTodos(int id, String name) async {
    var db = await DatabaseConnection.databaseAccess();

    var updatedTodo = Map<String, dynamic>();
    updatedTodo["name"] = name;

    await db.update("todos", updatedTodo, where: "id = ?", whereArgs: [id]);
  }

  Future<List<Todos>> getTodos() async {
    var db = await DatabaseConnection.databaseAccess();
    List<Map<String, dynamic>> rows = await db.rawQuery("SELECT * FROM todos");

    return List.generate(rows.length, (index) {
      var row = rows[index];
      var id = row['id'];
      var name = row['name'];

      return Todos(id: id, name: name);
    });
  }

  Future<List<Todos>> searchTodo(String searchWord) async {
    var db = await DatabaseConnection.databaseAccess();
    List<Map<String, dynamic>> rows = await db
        .rawQuery("SELECT * FROM todos WHERE name LIKE ('%$searchWord%')");

    return List.generate(rows.length, (index) {
      var row = rows[index];
      var id = row['id'];
      var name = row['name'];

      return Todos(id: id, name: name);
    });
  }

  Future<void> deleteTodo(int id) async {
    var db = await DatabaseConnection.databaseAccess();

    await db.delete("todos", where: "id = ?", whereArgs: [id]);
  }
}
