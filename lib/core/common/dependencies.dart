import 'package:api_request/api_request.dart';
import 'package:get_it/get_it.dart';
import 'package:starter_arch/core/utils/local_storage_utils.dart';
import 'package:starter_arch/features/home/blocs/home_bloc.dart';

final getIt = GetIt.instance;

class AppDependencies {
  static init() async {
    ApiRequestOptions.instance?.config(
      /// set base url for all request
      baseUrl: 'https://jsonplaceholder.typicode.com/',
    );
    await LocalStorageUtils.init();

    getIt.registerLazySingleton(() => HomeBloc());
  }
}
