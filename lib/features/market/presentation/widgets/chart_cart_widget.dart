import 'package:flutter/material.dart';

class ChartPeriods extends StatelessWidget {
  final String selected;
  final Function(String) onSelect;

  const ChartPeriods({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final items = ["1h", "1d", "1w", "1m", "1y"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items.map((e) {
        final isActive = e == selected;
        return GestureDetector(
          onTap: () => onSelect(e),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              e,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[600],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// import 'package:dio/dio.dart';
// import 'package:fintech/core/databases/api/end_points.dart';
// import 'package:fintech/features/market/data/models/chart_data_model.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';

// class CryptoChartCard extends StatefulWidget {
//   final String coinId;
//   const CryptoChartCard({super.key, required this.coinId});

//   @override
//   State<CryptoChartCard> createState() => _CryptoChartCardState();
// }

// class _CryptoChartCardState extends State<CryptoChartCard> {
//   String selected = "1d";
//   late Future<ChartDataModel> _chartDataFuture;
//   final Dio _dio = Dio();
//   double currentPrice = 0.0;
//   double percentageChange = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     print('[CryptoChartCard] initState called.');
//     _chartDataFuture = _fetchChartData(); // 🔥 رجّعيه Future
//   }

//   Future<ChartDataModel> _fetchChartData() async {
//     print('[_fetchChartData] called');

//     String days;
//     String interval;

//     switch (selected) {
//       case "1h":
//         days = "1";
//         interval = "hourly";
//         break;
//       case "1d":
//         days = "1";
//         interval = "daily";
//         break;
//       case "1w":
//         days = "7";
//         interval = "daily";
//         break;
//       case "1m":
//         days = "30";
//         interval = "daily";
//         break;
//       case "1y":
//         days = "365";
//         interval = "daily";
//         break;
//       default:
//         days = "1";
//         interval = "daily";
//     }

//     final url = EndPoints.coinChartData(
//       id: widget.coinId,
//       days: days,
//       interval: interval,
//     );
//     print('[_fetchChartData] Making API call to: $url');

//     try {
//       final response = await _dio.get(url);
//       print(
//         '[_fetchChartData] API call successful. Response status: ${response.statusCode}',
//       );
//       final chartData = ChartDataModel.fromJson(response.data);
//       print(
//         '[_fetchChartData] ChartDataModel parsed. Prices count: ${chartData.prices.length}',
//       );

//       if (chartData.prices.isNotEmpty) {
//         final last = chartData.prices.last.price;
//         final first = chartData.prices.first.price;

//         setState(() {
//           currentPrice = last;
//           percentageChange = ((last - first) / first) * 100;
//         });
//       }

//       return chartData;
//     } catch (e) {
//       print("Error: $e");
//       rethrow;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(18.r),
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.surface,
//         borderRadius: BorderRadius.circular(20.r),
//         boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "\$${currentPrice.toStringAsFixed(2)}",
//                     style: TextStyle(
//                       fontSize: 32.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Theme.of(context).brightness == Brightness.dark
//                           ? Color(0xffE1F8D3)
//                           : Color(0xff152C07),
//                     ),
//                   ),
//                   Gap(4.h),
//                   const Text(
//                     "/ 1 BTC",
//                     style: TextStyle(color: Color(0xff5D5C5D)),
//                   ),
//                 ],
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.w),
//                 decoration: BoxDecoration(
//                   color: percentageChange >= 0
//                       ? Theme.of(context).colorScheme.primary
//                       : Colors.red,
//                   borderRadius: BorderRadius.circular(12.r),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(
//                       percentageChange >= 0
//                           ? Icons.arrow_upward
//                           : Icons.arrow_downward,
//                       color: Theme.of(context).colorScheme.surface,
//                       size: 16.sp,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       "${percentageChange.toStringAsFixed(2)}%",
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.surface,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Gap(20),
//           SizedBox(
//             height: 200.h,
//             child: FutureBuilder<ChartDataModel>(
//               future: _chartDataFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else if (snapshot.hasData) {
//                   final prices = snapshot.data!.prices;
//                   if (prices.isEmpty) {
//                     return const Center(child: Text('No data available'));
//                   }

//                   final spots = prices
//                       .asMap()
//                       .entries
//                       .map(
//                         (entry) =>
//                             FlSpot(entry.key.toDouble(), entry.value.price),
//                       )
//                       .toList();

//                   final minPrice = prices
//                       .map((e) => e.price)
//                       .reduce((a, b) => a < b ? a : b);
//                   final maxPrice = prices
//                       .map((e) => e.price)
//                       .reduce((a, b) => a > b ? a : b);

//                   return LineChart(
//                     LineChartData(
//                       minX: 0,
//                       maxX: (prices.length - 1).toDouble(),
//                       minY: minPrice * 0.95, // 5% buffer
//                       maxY: maxPrice * 1.05, // 5% buffer
//                       gridData: FlGridData(
//                         show: true,
//                         drawVerticalLine: false,
//                         getDrawingHorizontalLine: (value) => FlLine(
//                           color: const Color(0xffBEBEBE),
//                           strokeWidth: 1,
//                           dashArray: [6, 10],
//                         ),
//                       ),
//                       borderData: FlBorderData(show: false),
//                       lineBarsData: [
//                         LineChartBarData(
//                           spots: spots,
//                           isCurved: true,
//                           barWidth: 1,
//                           color: Theme.of(context).brightness == Brightness.dark
//                               ? const Color(0xffBEBEBE)
//                               : const Color(0xff1A2D6B),
//                           dotData: FlDotData(show: false),
//                           belowBarData: BarAreaData(
//                             show: true,
//                             gradient: const LinearGradient(
//                               colors: [Color(0xFF1E1F4B), Color(0x1A1E1F4B)],
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                             ),
//                           ),
//                         ),
//                       ],
//                       titlesData: FlTitlesData(show: false),
//                     ),
//                   );
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ),
//           Gap(16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               buildTimeButton("1h"),
//               buildTimeButton("1d"),
//               buildTimeButton("1w"),
//               buildTimeButton("1m"),
//               buildTimeButton("1y"),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildTimeButton(String label) {
//     bool active = selected == label;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selected = label;
//           _chartDataFuture = _fetchChartData();
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
//         decoration: BoxDecoration(
//           color: active
//               ? Theme.of(context).colorScheme.primary
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(8.r),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: active
//                 ? Theme.of(context).colorScheme.surface
//                 : Colors.grey.shade700,
//             fontWeight: active ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
// }
