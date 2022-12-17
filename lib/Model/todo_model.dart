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

  const TodoModel({required this.title,required this.content , required this.date});

  factory TodoModel.fromJson(Map<String , dynamic>json) {
    return TodoModel(title: json['title'], content: json['content'] , date: json['date']);
  }

  Map<String , dynamic> toJson()=>{ "title" : title , "content" : content , "date" : date};

}