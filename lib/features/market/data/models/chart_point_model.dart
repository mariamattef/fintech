import 'package:fintech/features/market/domain/entities/chart_point_entity.dart';

class ChartPointModel extends ChartPointEntity {
  ChartPointModel({
    required super.time,
    required super.price,
  });

  factory ChartPointModel.fromJson(List<dynamic> json) {
    return ChartPointModel(
      time: DateTime.fromMillisecondsSinceEpoch(json[0]),
      price: (json[1] as num).toDouble(),
    );
  }

  factory ChartPointModel.fromMap(Map<String, dynamic> map) {
    return ChartPointModel(
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time.millisecondsSinceEpoch,
      'price': price,
    };
  }

  List<dynamic> toJson() {
    return [
      time.millisecondsSinceEpoch,
      price,
    ];
  }
}
