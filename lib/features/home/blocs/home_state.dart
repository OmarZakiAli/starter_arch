import 'package:flutter/foundation.dart';

import 'package:starter_arch/core/data/post.model.dart';

class HomeState {
  final List<PostModel>? posts;
  final bool isLoading;
  const HomeState({this.posts, this.isLoading = false});

  HomeState copyWith({
    List<PostModel>? posts,
    bool? isLoading,
  }) {
    return HomeState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        listEquals(other.posts, posts) &&
        other.isLoading == isLoading;
  }

  @override
  int get hashCode => posts.hashCode ^ isLoading.hashCode;
}
