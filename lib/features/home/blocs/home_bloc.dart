import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:starter_arch/features/home/actions/get_posts.action.dart';
import 'package:starter_arch/features/home/blocs/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(const HomeState(isLoading: true, posts: []));

  initPosts() {
    GetPostsAction action = GetPostsAction();
    action.onError = (e) {
      toast(e.toString());
      emit(state.copyWith(isLoading: false));
    };
    action.onSuccess = (s) {
      emit(state.copyWith(isLoading: false, posts: s?.posts));
    };

    action.onQueue();
  }
}
