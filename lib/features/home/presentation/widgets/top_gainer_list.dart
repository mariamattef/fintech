
import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/features/home/presentation/widgets/gainer_tile_widget.dart';
import 'package:flutter/material.dart';

// TODO: Replace with a BlocBuilder and a real data source
class TopGainersList extends StatelessWidget {
  const TopGainersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GainerTileWidget(
            name: "ethereum".tr(),
            symbol: "eth".tr(),
            price: "\$20,788",
            change: "+0.25%",
            icon: Icons.diamond_outlined,
          ),
        );
      },
    );
  }
}
