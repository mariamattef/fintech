import 'package:dio/dio.dart';
import 'package:fintech/core/connection/network_info.dart';
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
import 'package:fintech/features/market/data/data_source/chart_local_data_source.dart';
import 'package:fintech/features/market/data/data_source/chart_remote_data_source.dart';
import 'package:fintech/features/market/data/data_source/crypto_details_remote_data_source.dart';
import 'package:fintech/features/market/data/data_source/crypto_remote_data_source.dart';
import 'package:fintech/features/market/data/repos/chart_repository_impl.dart';
import 'package:fintech/features/market/data/repos/crypto_details_repository_impl.dart';
import 'package:fintech/features/market/data/repos/crypto_repository_impl.dart';
import 'package:fintech/features/market/domain/repos/chart_repository.dart';
import 'package:fintech/features/market/domain/repos/crypto_details_repository.dart';
import 'package:fintech/features/market/domain/repos/crypto_repository.dart';
import 'package:fintech/features/market/domain/use_cases/get_chart_usecase.dart';
import 'package:fintech/features/market/domain/use_cases/get_crypto_details_usecase.dart';
import 'package:fintech/features/market/domain/use_cases/get_crypto_usecase.dart';
import 'package:fintech/features/market/presentation/cubits/chart_cubit/chart_cubit.dart';
import 'package:fintech/features/market/presentation/cubits/crypto_cubit/crypto_cubit.dart';
import 'package:fintech/features/market/presentation/cubits/crypto_details_cubit/crypto_details_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Core
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance(
        checkTimeout: const Duration(seconds: 20),
        checkInterval: const Duration(seconds: 20),
      ));
  sl.registerLazySingleton<InternetService>(
    () => InternetServiceImpl(internetConnectionChecker: sl()),
  );
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  // Secure Storage
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => SecureStorageService(sl()));
  // Hive
  sl.registerLazySingleton<HiveInterface>(() => Hive);
  // Features
  // Auth
  sl.registerLazySingleton(() => AuthCubit(sl()));
  sl.registerLazySingleton<MarketRepository>(() => MarketRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetMarketOverviewUseCase(sl()));

  sl.registerLazySingleton(() => MarketOverviewCubit(sl()));

  sl.registerLazySingleton<TrendingRemoteDataSource>(
    () => TrendingRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<TrendingRepository>(
    () => TrendingRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<TopgainerRepository>(
    () => TopgainerRepositoryImpl(sl()),
  );

  // Market
  // Data source
  sl.registerLazySingleton<MarketOverviewDataSource>(
    () => MarketOverviewDataSourceImpl(api: sl(), internetService: sl()),
  );
  sl.registerLazySingleton<TopgainerRemoteDataSource>(
    () => TopgainerRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CryptoRemoteDataSource>(
    () => CryptoRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ChartRemoteDataSource>(
    () => ChartRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ChartLocalDataSource>(
    () => ChartLocalDataSourceImpl(sl<HiveInterface>().box('chart_box')),
  );
  sl.registerLazySingleton<CryptoDetailsRemoteDataSource>(
    () => CryptoDetailsRemoteDataSourceImpl(sl()),
  );

  // repos
  sl.registerLazySingleton<CryptoRepository>(
    () => CryptoRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ChartRepository>(
    () => ChartRepositoryImpl(sl(), sl()),
  );

  sl.registerLazySingleton<CryptoDetailsRepository>(
    () => CryptoDetailsRepositoryImpl(remoteDataSource: sl()),
  );
  // Domain  Use case
  sl.registerLazySingleton(() => GetCryptoUsecase(sl()));
  sl.registerLazySingleton(() => GetChartUseCase(sl()));
  sl.registerLazySingleton(() => TopgainersCubit(sl()));
  sl.registerLazySingleton(() => GetCryptoDetailsUsecase(sl()));
  sl.registerLazySingleton(() => GetTopgainerUsecase(sl()));
  sl.registerLazySingleton(() => GetTrendingUsecase(sl()));

  // Presentation

  sl.registerFactory(() => CryptoCubit(getCryptoUsecase: sl()));
  sl.registerFactory(() => ChartCubit(sl()));
  sl.registerFactory(() => CryptoDetailsCubit(sl()));
  sl.registerLazySingleton(() => TrendingCubit(sl()));
}
