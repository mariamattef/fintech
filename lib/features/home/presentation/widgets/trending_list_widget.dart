import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/features/home/domain/enteties/trending_entity.dart';
import 'package:fintech/features/home/presentation/widgets/trending_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TrendingListWidget extends StatelessWidget {
  final List< TrendingEntity> trendingEntity;
  const TrendingListWidget({super.key, required this.trendingEntity});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: trendingEntity.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 10.0.w),
          child: TrendingCardWidget(
            name: trendingEntity[index].name,
            symbol: trendingEntity[index].symbol,
            price: trendingEntity[index].priceBtc.toStringAsFixed(6),
            change: trendingEntity[index].change,
            img: trendingEntity[index].imgThumb,
          ),
        );
      },
    );
  }
}
