import 'package:equatable/equatable.dart';
import 'package:todo_app/App/Utils/general.dart';


class BaseTodoModel extends Equatable {
  final String title , content , date;
  final int checkTitleDirection , checkContentDirection;

  const BaseTodoModel({
    required this.title ,
    required this.content ,
    required this.date ,
    required this.checkTitleDirection ,
    required this.checkContentDirection
  });

  @override
  List<Object?> get props => [
    title ,
    date ,
    content ,
    checkTitleDirection ,
    checkContentDirection
  ];
}


class TodoModel extends BaseTodoModel {
  const TodoModel({
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