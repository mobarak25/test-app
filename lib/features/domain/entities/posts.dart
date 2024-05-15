class Posts {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const Posts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
