import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CryptoChartCard extends StatefulWidget {
  const CryptoChartCard({super.key});

  @override
  State<CryptoChartCard> createState() => _CryptoChartCardState();
}

class _CryptoChartCardState extends State<CryptoChartCard> {
  String selected = "1d"; 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$54,382.64",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Color(0xffE1F8D3)
                          : Color(0xff152C07),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("/ 1 BTC", style: TextStyle(color: Color(0xff5D5C5D))),
                ],
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: Theme.of(context).colorScheme.surface,
                      size: 16.sp,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "15.3%",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Gap(20),
          SizedBox(
            height: 200.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 7,
                    minY: 0,
                    maxY: 12,
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Color(0xffBEBEBE),
                        strokeWidth: 1,
                        dashArray: [6, 10],
                      ),
                    ),

                    borderData: FlBorderData(show: false),

                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 3),
                          FlSpot(1, 6),
                          FlSpot(2, 3),
                          FlSpot(3, 6.5),
                          FlSpot(4, 2),
                          FlSpot(5, 7),
                          FlSpot(6, 3.2),
                          FlSpot(7, 9),
                        ],
                        isCurved: true,
                        barWidth: 1,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Color(0xffBEBEBE)
                            : const Color(0xff1A2D6B),
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF1E1F4B),
                              const Color(0x1A1E1F4B),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],

                    titlesData: FlTitlesData(show: false),
                  ),
                ),

                Positioned(
                  top: 55.h,
                  right: 50.w,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.h,
                          vertical: 4.w,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffF56C2A),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          "\$54,382.64",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Gap(3),
                      CircleAvatar(
                        radius: 4.r,
                        backgroundColor: Color(0xffF56C2A),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTimeButton("1h"),
              buildTimeButton("1d"),
              buildTimeButton("1w"),
              buildTimeButton("1m"),
              buildTimeButton("1y"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTimeButton(String label) {
    bool active = selected == label;

    return GestureDetector(
      onTap: () {
        setState(() => selected = label);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        decoration: BoxDecoration(
          color: active
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active
                ? Theme.of(context).colorScheme.surface
                : Colors.grey.shade700,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

// class ChartCartWidget extends StatefulWidget {
//   final Color primaryColor;
//   const ChartCartWidget({super.key, required this.primaryColor});

//   @override
//   State<ChartCartWidget> createState() => _ChartCartWidgetState();
// }

// class _ChartCartWidgetState extends State<ChartCartWidget> {
//   String _selectedPeriod = '1d';
//   final List<String> _periods = ['1h', '1d', '1w', '1m', '1y'];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20.r),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.r),
//         border: Border.all(
//           color: Colors.blue.withValues(alpha: 0.3),
//           width: 1,
//         ), // Simulating the blue border outline
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withValues(alpha: 0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
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
//                     "\$54,382.64",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: widget.primaryColor,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     "/ 1 BTC",
//                     style: TextStyle(color: Colors.grey, fontSize: 12),
//                   ),
//                 ],
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 8,
//                 ),
//                 decoration: BoxDecoration(
//                   color: widget.primaryColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Row(
//                   children: [
//                     Icon(Icons.arrow_outward, color: Colors.white, size: 14),
//                     SizedBox(width: 4),
//                     Text(
//                       "15.3%",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 30),
//           // Custom Chart Painter
//           SizedBox(
//             height: 180,
//             width: double.infinity,
//             child: CustomPaint(
//               painter: CryptoChartPainter(color: widget.primaryColor),
//               child: Stack(
//                 children: [
//                   // Simulated Tooltip Positioned manually for the demo
//                   Positioned(
//                     right: 40,
//                     top: 20,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8,
//                         vertical: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.orange,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Text(
//                         "\$54,382.64",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           _buildTimeSelector(widget.primaryColor),
//         ],
//       ),
//     );
//   }

//   Widget _buildTimeSelector(Color primaryColor) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: _periods.map((period) {
//         final isSelected = _selectedPeriod == period;
//         return GestureDetector(
//           onTap: () => setState(() => _selectedPeriod = period),
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             decoration: BoxDecoration(
//               color: isSelected ? primaryColor : Colors.transparent,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Text(
//               period,
//               style: TextStyle(
//                 color: isSelected ? Colors.white : Colors.grey,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
