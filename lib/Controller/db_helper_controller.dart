import 'package:sqflite/sqflite.dart';
import 'package:todo_app/Core/Utils/general.dart';
import 'package:todo_app/Model/todo_model.dart';


abstract class BaseDBHelperController {
  Database? db;

  /// Function Open DataBase
  Future<Database?> createDatabase();

  /// Function Create Item
  Future<int> createTodo(TodoModel todoModel);

  /// Function Fetch Data Items
  Future<List<Map<String,dynamic>>> fetchAllTodo();

  /// Function Delete Item
  Future<int> deleteTodo(int id);


  /// Function Update Item
  Future<int> updateTodo({required TodoModel todoModel ,required int id});
}


class DBHelperController implements BaseDBHelperController {

  @override
  Database? db;


  @override
  Future<Database?> createDatabase() async {
    if(db != null) {
      return db;
    }

    //final String path = join(await getDatabasesPath() , "todo.db");

    db = await openDatabase( "todo.db" ,
        version: 1 ,
        onCreate: (Database db , int v) {
      db.execute(""
          "create table todo(${ModelEnum.id.name} integer primary key autoincrement,"
          " ${ModelEnum.title.name} varchar(100), content varchar(1024),"
          " ${ModelEnum.date.name} varchar(100),"
          " ${ModelEnum.checkTitleDirection.name} integer ,"
          " ${ModelEnum.checkContentDirection.name} integer)");
    });

    return db;
  }


  @override
  Future<int> createTodo(TodoModel todoModel) async {
    final Database? database = await createDatabase();
    return database!.insert("todo",todoModel.toJson());
  }


  @override
  Future<List<Map<String,dynamic>>> fetchAllTodo() async {
    final Database? database = await createDatabase();
    return database!.query("todo" , orderBy: "date DESC");
  }


  @override
  Future<int> deleteTodo(int id) async {
    final Database? database = await createDatabase();
    return database!.delete("todo" , where: "${ModelEnum.id.name} = ?" , whereArgs: [id]);
  }


  @override
  Future<int> updateTodo({required TodoModel todoModel ,required int id}) async {
    final Database? database = await createDatabase();
    return database!.update("todo", todoModel.toJson() , where: '${ModelEnum.id.name} = ?' , whereArgs: [id]);
  }


}