import 'package:dio/dio.dart';
import 'package:fintech/core/databases/api/api_consumer.dart';
import 'package:fintech/core/databases/api/dio_consumer.dart';
import 'package:fintech/core/storage/secure_storage_service.dart';
import 'package:fintech/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:fintech/features/home/data/data_source/market_remote_data_source.dart';
import 'package:fintech/features/home/data/data_source/topgainer_remote_data_source.dart';
import 'package:fintech/features/home/data/data_source/trending_remote_data_source.dart';
import 'package:fintech/features/home/data/repos/market_repository_impl.dart';
import 'package:fintech/features/home/data/repos/topgainer_repository_impl.dart';
import 'package:fintech/features/home/data/repos/trending_repository_impl.dart';
import 'package:fintech/features/home/domain/repos/market_repository.dart';
import 'package:fintech/features/home/domain/repos/topgainer_repository.dart';
import 'package:fintech/features/home/domain/repos/trending_repository.dart';
import 'package:fintech/features/home/domain/usecases/get_market_overview_usecase.dart';
import 'package:fintech/features/home/domain/usecases/get_topgainer_usecase.dart';
import 'package:fintech/features/home/domain/usecases/get_trending_usecase.dart';
import 'package:fintech/features/home/presentation/cubits/overview_cubit/overview_cubit.dart';
import 'package:fintech/features/home/presentation/cubits/topgainers_cubit/topgainers_cubit.dart';
import 'package:fintech/features/home/presentation/cubits/trending_cubit/trending_cubit.dart';
import 'package:fintech/features/market/data/data_source/crypto_remote_data_source.dart';
import 'package:fintech/features/market/data/repos/crypto_repository_impl.dart';
import 'package:fintech/features/market/domain/repos/crypto_repository.dart';
import 'package:fintech/features/market/domain/use_cases/get_crypto_usecase.dart';
import 'package:fintech/features/market/presentation/cubits/crypto_cubit/crypto_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Core
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  // Secure Storage
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => SecureStorageService(sl()));

  // Features
  // Auth
  sl.registerLazySingleton(() => AuthCubit(sl()));

  // Home
  // Data
  sl.registerLazySingleton<MarketOverviewDataSource>(
    () => MarketOverviewDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<MarketRepository>(() => MarketRepositoryImpl(sl()));
  // Domain
  sl.registerLazySingleton(() => GetMarketOverviewUseCase(sl()));
  // Presentation
  sl.registerLazySingleton(() => MarketOverviewCubit(sl()));

  sl.registerLazySingleton<TrendingRemoteDataSource>(
    () => TrendingRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<TrendingRepository>(
    () => TrendingRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetTrendingUsecase(sl()));
  sl.registerLazySingleton(() => TrendingCubit(sl()));

  sl.registerLazySingleton<TopgainerRemoteDataSource>(
    () => TopgainerRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<TopgainerRepository>(
    () => TopgainerRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetTopgainerUsecase(sl()));
  sl.registerLazySingleton(() => TopgainersCubit(sl()));

  // Market
  // Data
  sl.registerLazySingleton<CryptoRemoteDataSource>(
    () => CryptoRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CryptoRepository>(
    () => CryptoRepositoryImpl(remoteDataSource: sl()),
  );
  // Domain
  sl.registerLazySingleton(() => GetCryptoUsecase(sl()));
  // Presentation
  sl.registerFactory(() => CryptoCubit(getCryptoUsecase: sl()));
}
