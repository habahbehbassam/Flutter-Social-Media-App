import '../../domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          body: body,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      body: json['body'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'body': body,
      'title': title,
    };
  }
}
