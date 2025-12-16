import 'package:fintech/features/market/domain/entities/crypto_details_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_details_state.freezed.dart';

@freezed
class CryptoDetailsState with _$CryptoDetailsState {
  const factory CryptoDetailsState.initial() = _Initial;

  const factory CryptoDetailsState.loading() = _Loading;

  const factory CryptoDetailsState.success(CryptoDetailsEntity crypto) = _Success;

  const factory CryptoDetailsState.failure(String message) = _Failure;
}
