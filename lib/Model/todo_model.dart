// class TodoModel {
//
//   final String title , content ;
//
//   const TodoModel({required this.title,required this.content });
//
//   factory TodoModel.fromJson(Map<String , dynamic>json) {
//     return TodoModel(title: json['title'], content: json['content'] );
//   }
//
//   Map<String , dynamic> toJson()=>{ "title" : title , "content" : content };
//
// }


class TodoModel {

  final String title , content , date;
  final int checkTitleDirection , checkContentDirection;

  const TodoModel({
    required this.checkTitleDirection ,
    required this.checkContentDirection ,
    required this.title ,
    required this.content ,
    required this.date
  });

  factory TodoModel.fromJson(Map<String , dynamic>json) {
    return TodoModel(
        title: json['title'] ,
        content: json['content'] ,
        date: json['date'] ,
        checkTitleDirection: json['checkTitleDirection'] ,
        checkContentDirection: json['checkContentDirection']

    );
  }

  Map<String , dynamic> toJson() => {
    "title" : title ,
    "content" : content ,
    "date" : date ,
    "checkTitleDirection" : checkTitleDirection ,
    "checkContentDirection" : checkContentDirection
  };

}