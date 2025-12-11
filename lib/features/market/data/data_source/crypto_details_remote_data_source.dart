import 'package:fintech/core/databases/api/api_consumer.dart';
import 'package:fintech/core/databases/api/end_points.dart';
import 'package:fintech/features/market/data/models/crypto_model/crypto_details_model.dart';

abstract class CryptoDetailsRemoteDataSource {
  Future<CryptoDetailsModel> getCoinDetails({required String id});
}

class CryptoDetailsRemoteDataSourceImpl
    implements CryptoDetailsRemoteDataSource {
  ApiConsumer api;
  CryptoDetailsRemoteDataSourceImpl(this.api);

  @override
  Future<CryptoDetailsModel> getCoinDetails({required String id}) async {
    final response = await api.get(EndPoints.coinDetails(id: id));
    return CryptoDetailsModel.fromJson(response);
  }
}
