import 'package:todo_app/Core/Utils/enums.dart';


class BaseTodoModel {
  final String title , content , date;
  final int checkTitleDirection , checkContentDirection;

  const BaseTodoModel({
    required this.title ,
    required this.content ,
    required this.date ,
    required this.checkTitleDirection ,
    required this.checkContentDirection
  });
}


class TodoModel extends BaseTodoModel {
  TodoModel({

    required super.title ,
    required super.content ,
    required super.date ,
    required super.checkTitleDirection ,
    required super.checkContentDirection
  });



  factory TodoModel.fromJson(Map<String , dynamic>json) {
    return TodoModel(
        title: json[ModelEnum.title.name] ,
        content: json[ModelEnum.content.name] ,
        date: json[ModelEnum.date.name] ,
        checkTitleDirection: json[ModelEnum.checkTitleDirection.name] ,
        checkContentDirection: json[ModelEnum.checkContentDirection.name]

    );
  }

  Map<String , dynamic> toJson() => {
    ModelEnum.title.name : title ,
    ModelEnum.content.name : content ,
    ModelEnum.date.name : date ,
    ModelEnum.checkTitleDirection.name : checkTitleDirection ,
    ModelEnum.checkContentDirection.name : checkContentDirection
  };

}