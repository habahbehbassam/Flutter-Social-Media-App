class UserEntity {
  final int albumId;
  final int userId;
  final String name;
  final String url;
  final String thumbnailUrl;

  UserEntity({
    required this.albumId,
    required this.userId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
  });
}
