import 'package:fintech/features/market/domain/entities/crypto_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_state.freezed.dart';

@freezed
class CryptoState with _$CryptoState {
  const factory CryptoState.initial() = _Initial;
  const factory CryptoState.loading() = _Loading;
  const factory CryptoState.success(List<CryptoEntity> data, int currentPage, bool hasMore) = _Success;
  const factory CryptoState.error(String message) = _Error;
}
