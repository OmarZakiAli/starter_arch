import 'package:api_request/api_request.dart';
import 'package:starter_arch/core/data/post.model.dart';

class ShowPostAction extends ApiRequestAction<PostModel> {
  final int? id;
  ShowPostAction({this.id});

  @override
  bool get authRequired => false;

  @override
  String get path => 'posts/$id';

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  ResponseBuilder<PostModel> get responseBuilder =>
      (map) => PostModel.fromMap(map);
}
