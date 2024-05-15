import 'package:test_app/features/domain/entities/default_response.dart';
import 'package:test_app/features/domain/entities/posts.dart';

class EntityMap {
  static T? fromJson<T, K>(dynamic json) {
    switch (T) {
      case DefaultResponse:
        return DefaultResponse.fromJson(json) as T;
      case Posts:
        return Posts.fromJson(json) as T;

      default:
        throw Exception('Unknown class');
    }
  }
}
