import 'package:fintech/features/home/domain/enteties/topgainer_entity.dart';
import 'package:fintech/features/home/presentation/widgets/gainer_tile_widget.dart';
import 'package:flutter/material.dart';

class TopGainersList extends StatelessWidget {
  final List<TopgainerEntity> topGainers;
  const TopGainersList({super.key, required this.topGainers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: topGainers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GainerTileWidget(
            name: topGainers[index].name ?? '',
            symbol: topGainers[index].symbol ?? '',
            price: (topGainers[index].currentPrice ?? 0.0).toString(),
            change: (topGainers[index].priceChangePercentage24h ?? 0.0)
                .toString(),
            img: topGainers[index].imageUrl ?? '',
          ),
        );
      },
    );
  }
}
