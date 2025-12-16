import 'package:equatable/equatable.dart';

class CryptoCurrency extends Equatable {
  final String id;
  final double usdPrice;
  final double usd24hrChange;
  final String? image;

  const CryptoCurrency({
    required this.id,
    required this.usdPrice,
    required this.usd24hrChange,
    this.image,
  });

  @override
  List<Object?> get props => [id, usdPrice, usd24hrChange, image];
}
