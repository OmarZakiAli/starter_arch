import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_arch/core/common/dependencies.dart';
import 'package:starter_arch/core/data/post.model.dart';
import 'package:starter_arch/core/utils/local_storage_utils.dart';
import 'package:starter_arch/features/home/blocs/home_bloc.dart';
import 'package:starter_arch/features/home/blocs/home_state.dart';
import 'package:starter_arch/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = getIt.get<HomeBloc>();

  @override
  void initState() {
    super.initState();
    bloc.initPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appColors.background,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (context.locale == const Locale("ar")) {
                  context.setLocale(Locale("en"));
                } else {
                  context.setLocale(Locale("ar"));
                }
              },
              icon: const Icon(Icons.language)),
          IconButton(
              onPressed: () {
                if (LocalStorageUtils.isDarkMode()) {
                  LocalStorageUtils.setIsDarkMode(false);
                } else {
                  LocalStorageUtils.setIsDarkMode(true);
                }
              },
              icon: const Icon(Icons.dark_mode))
        ],
        title: Text("home".tr()),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        builder: (context, state) {
          return state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: state.posts?.length,
                  itemBuilder: (c, i) {
                    PostModel? post = bloc.state.posts?[i];

                    return ListTile(
                      title: Text(
                        post?.title ?? "",
                        style: Theme.of(context).appTextStyles.title,
                      ),
                      subtitle: Text(
                        post?.body ?? "",
                        style: Theme.of(context).appTextStyles.subTitle,
                      ),
                    );
                  });
        },
      ),
    );
  }
}
