import 'package:fintech/features/market/presentation/widgets/state_row_widget.dart';
import 'package:flutter/cupertino.dart';

class StaticsListWidget extends StatelessWidget {
  final double price;
  final double marketCap;
  final double volume24h;
  final double availableSupply;
  final double? maxSupply;

  const StaticsListWidget({
    super.key,
    required this.price,
    required this.marketCap,
    required this.volume24h,
    required this.availableSupply,
    this.maxSupply,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StetRowWidget(label: "Current Price", value: "$price \$"),
        StetRowWidget(label: "Market Cap", value: "$marketCap \$"),
        StetRowWidget(label: "Volume 24h", value: "$volume24h \$"),
        StetRowWidget(label: "Available Supply", value: "$availableSupply"),
        StetRowWidget(
          label: "Max Supply",
          value: maxSupply?.toString() ?? "N/A",
          isLast: true,
        ),
      ],
    );
  }
}
