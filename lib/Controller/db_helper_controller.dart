import 'package:sqflite/sqflite.dart';
import 'package:todo_app/Model/todo_model.dart';

class DBHelperController {
  static Database? _db;

  Future<Database?> createDatabase() async {
    if(_db != null) {
      return _db;
    }

    //final String path = join(await getDatabasesPath() , "todo.db");

    _db = await openDatabase( "todo.db" ,
        version: 1 ,
        onCreate: (Database db , int v) {
      db.execute("create table todo(id integer primary key autoincrement, title varchar(100), content varchar(1024), date varchar(100))");
    });

    return _db;
  }


  Future<int> createTodo(TodoModel todoModel) async {
    final Database? database = await createDatabase();
    return database!.insert("todo",todoModel.toJson());
  }


  Future<List<Map<String,dynamic>>> fetchAllTodo() async {
    final Database? database = await createDatabase();
    return database!.query("todo" , orderBy: "date DESC");
  }


  Future<int> deleteTodo(int id) async {
    final Database? database = await createDatabase();
    return database!.delete("todo" , where: "id = ?" , whereArgs: [id]);
  }


  Future<int> updateTodo({required TodoModel todoModel ,required int id}) async {
    final Database? database = await createDatabase();
    return database!.update("todo", todoModel.toJson() , where: 'id = ?' , whereArgs: [id]);
  }
}