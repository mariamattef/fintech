import 'package:dio/dio.dart';
import 'package:fintech/core/storage/secure_storage_service.dart';
import 'package:fintech/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Dio
  sl.registerLazySingleton(() => Dio());

  // Secure Storage
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => SecureStorageService(sl()));

  // sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  // // network info
  // sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  // sl.registerLazySingleton<InternetService>(
  //   () => InternetServiceImpl(internetConnectionChecker: sl()),
  // );

  // Auth Feature
  // Cubit
  sl.registerLazySingleton(() => AuthCubit(sl()));

  // // Use Cases
  // sl.registerLazySingleton(() => AuthUsecase(userRepository: sl()));
  // sl.registerLazySingleton(() => VerifyOtpUseCase(userRepository: sl()));
  // sl.registerLazySingleton(() => LogoutUseCase(userRepository: sl()));

  // // Repository
  // sl.registerLazySingleton<UserRepository>(
  //   () => UserRepositoryImpl(authRemoteDataSource: sl()),
  // );

  // // Data Sources
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl(dio: sl()),
  // );

  // // home feature
  // // cubits
  // sl.registerFactory(() => ProductCubit(sl()));
  // sl.registerFactory(() => CategoryCubit(sl()));

  // //usecases
  // sl.registerLazySingleton(() => ProductUsecase(sl()));
  // sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));

  // // repos
  // sl.registerLazySingleton<ProductRepository>(
  //   () => ProductRepositoryImpl(
  //     internetService: sl(),
  //     productRemoteDataSource: sl(),
  //   ),
  // );
  // sl.registerLazySingleton<CategoryRepository>(
  //   () => CategoryRepositoryImpl(
  //     internetService: sl(),
  //     categoryRemoteDataSource: sl(),
  //   ),
  // );

  // // data sources
  // sl.registerLazySingleton<ProductRemoteDataSource>(
  //   () => ProductRemoteDataSourceImpl(sl()),
  // );
  // sl.registerLazySingleton<CategoryRemoteDataSource>(
  //   () => CategoryRemoteDataSourceImpl(sl()),
  // );

  // // Review Feature
  // // Cubit
  // sl.registerFactory(() => ReviewsCubit(getReviewsUseCase: sl()));

  // // Use Cases
  // sl.registerLazySingleton(() => GetReviewsUseCase(sl()));

  // // Repository
  // sl.registerLazySingleton<ReviewRepository>(
  //   () => ReviewRepositoryImpl(remoteDataSource: sl()),
  // );

  // // Data Sources
  // sl.registerLazySingleton<ReviewRemoteDataSource>(
  //   () => ReviewRemoteDataSourceImpl(dio: sl()),
  // );
}
