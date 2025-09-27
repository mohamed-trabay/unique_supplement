import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:unique_supplement/core/utiles/api_service.dart';
import 'package:unique_supplement/features/home/data/repos/home.repo.impl.dart';
import 'package:unique_supplement/features/store/data/repo/store_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // ApiService
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // Home Repo
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );

  // Store Repo جديدة
  getIt.registerSingleton<StoreRepoImpl>(
    StoreRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
