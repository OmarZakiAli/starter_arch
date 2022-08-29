import 'package:equatable/equatable.dart';
import 'package:starter_arch/core/data/post.model.dart';

class HomeState extends Equatable {
  final List<PostModel>? posts;
  final bool isLoading;
  const HomeState({this.posts, this.isLoading = false});

  copyWith({List<PostModel>? posts, bool? isLoading}) {
    return HomeState(
        isLoading: isLoading ?? this.isLoading, posts: posts ?? this.posts);
  }

  @override
  List<Object?> get props => [isLoading, posts];
}
