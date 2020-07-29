// Data class for the mini application.
class TodoItem {
  final int id;
  final String content;
  bool isDone;
  final DateTime createdAt;

  TodoItem({this.id, this.content, this.isDone = false, this.createdAt});

  TodoItem.fromJsonMap(Map<String, dynamic> map)
      : id = map['id'],
        content = map['content'],
        isDone = map['isDone'],
        createdAt = DateTime.fromMillisecondsSinceEpoch(map['createdAt']);

  Map<String, dynamic> toJsonMap() => {
        'id': id,
        'content': content,
        'isDone': isDone,
        'createdAt': createdAt.millisecondsSinceEpoch,
      };
}
