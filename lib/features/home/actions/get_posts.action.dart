import 'package:api_request/api_request.dart';
import 'package:starter_arch/core/data/post.model.dart';

class GetPostsAction extends ApiRequestAction<PostsResponse> {
  @override
  bool get authRequired => false;

  @override
  String get path => 'posts';

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  ResponseBuilder<PostsResponse> get responseBuilder =>
      (list) => PostsResponse.fromList(list);
}

class PostsResponse {
  List<PostModel>? posts;
  PostsResponse({this.posts});

  PostsResponse.fromList(List<dynamic>? data) {
    if (data is List) {
      posts = <PostModel>[];
      for (var item in data) {
        posts?.add(PostModel.fromMap(item));
      }
    }
  }
}
