import 'package:get/instance_manager.dart';

import '../data/datasource/api_repository_impl.dart';
import '../data/datasource/local_repository_impl.dart';
import '../domain/repository/api_repository.dart';
import '../domain/repository/local_storage_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorageRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
  }
}
