// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

class TaskModel {
  String id;
  String? createdAt;
  String name;
  String? avatar;
  String? a;
  String? query;
  String? username;
  String? password;
  dynamic createAt;

  TaskModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
    this.a,
    this.query,
    this.username,
    this.password,
    this.createAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        createdAt: json["createdAt"],
        name: json["name"],
        avatar: json["avatar"],
        a: json["a"],
        query: json["query"],
        username: json["username"],
        password: json["password"],
        createAt: json["createAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt,
        "name": name,
        "avatar": avatar,
        "a": a,
        "query": query,
        "username": username,
        "password": password,
        "createAt": createAt,
      };
}
