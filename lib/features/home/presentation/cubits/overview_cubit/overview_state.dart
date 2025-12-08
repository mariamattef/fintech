import 'package:fintech/features/home/domain/enteties/market_over_view_entity.dart';

abstract class MarketOverviewState {}

class MarketOverviewInitial extends MarketOverviewState {}

class MarketOverviewLoading extends MarketOverviewState {}

class MarketOverviewSuccess extends MarketOverviewState {
  final MarketOverviewEntity data;
  MarketOverviewSuccess(this.data);
}

class MarketOverviewError extends MarketOverviewState {
  final String message;
  MarketOverviewError(this.message);
}
