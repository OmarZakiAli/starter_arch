import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:starter_arch/features/home/actions/get_posts.action.dart';
import 'package:starter_arch/features/home/blocs/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(const HomeState(isLoading: true, posts: []));

  initPosts() {
    GetPostsAction().run().then((value) {
      value.fold((error) {
        toast(error.message);
        emit(state.copyWith(isLoading: false));
      }, (data) {
        emit(state.copyWith(isLoading: false, posts: data?.posts));
      });
    });
  }
}
