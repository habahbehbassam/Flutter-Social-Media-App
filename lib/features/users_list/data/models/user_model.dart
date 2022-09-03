import 'package:flutter_social_media_app/features/users_list/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required int albumId,
    required int userId,
    required String name,
    required String url,
    required String thumbnailUrl,
  }) : super(
          userId: userId,
          albumId: albumId,
          name: name,
          thumbnailUrl: thumbnailUrl,
          url: url,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
      name: json['name'],
      albumId: json['albumId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
      'name': name,
      'albumId': albumId,
    };
  }
}
