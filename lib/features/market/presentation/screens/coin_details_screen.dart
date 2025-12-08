import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/market/presentation/widgets/chart_cart_widget.dart';
import 'package:fintech/features/market/presentation/widgets/coin_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CoinDetailsScreen extends StatefulWidget {
  static const String routeName = RoutesContants.coinDetails;
  const CoinDetailsScreen({super.key});

  @override
  State<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: AppTextStyles.headingH4,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Coin Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoinHeaderWidget(),
                  Gap(20.h),
                  CryptoChartCard(),
                  Gap(25),
                  Text(
                    "Statics",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  _buildStatisticsList(),
                  Gap(25.h),
                  Text("About Bitcoin", style: AppTextStyles.headingStyle18Po),
                  Gap(15.h),
                  Text(
                    "Bitcoin is a decentralized cryptocurrency originally described in a 2008 whitepaper by a person, or group of people, using the alias Satoshi Nakamoto. It was launched soon after, in January 2009.",
                    style: AppTextStyles.headingStyle16.copyWith(
                      color: Color(0xff5D5C5D),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
          BottomButtonsCoinsDetails(),
        ],
      ),
    );
  }

  Widget _buildStatisticsList() {
    return Column(
      children: [
        StetRowWidget(label: "Current Price", value: "44,826.12 \$"),
        StetRowWidget(label: "Market Cap", value: "836,819 \$"),
        StetRowWidget(label: "Volume 24h", value: "35,867 \$"),
        StetRowWidget(label: "Available Supply", value: "18,784"),
        StetRowWidget(label: "Max Supply", value: "21,000", isLast: true),
      ],
    );
  }
}

// --- Custom Painter for the Smooth Gradient Chart ---
class CryptoChartPainter extends CustomPainter {
  final Color color;

  CryptoChartPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Manually drawing a nice looking curve similar to the image
    // Starting point
    path.moveTo(0, size.height * 0.8);

    // Curve 1
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.5,
      size.width * 0.2,
      size.height * 0.7,
    );
    // Curve 2
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.8,
      size.width * 0.4,
      size.height * 0.6,
    );
    // Dip
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.5,
    );
    // Rise to peak
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.2,
      size.width * 0.8,
      size.height * 0.25,
    );
    // High Peak Point (The dot location)
    // path ends down
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.6,
      size.width,
      size.height * 0.5,
    );

    // Draw Shadow/Gradient below the line
    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [color.withOpacity(0.3), color.withOpacity(0.0)],
    );

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);

    // Draw the specific orange dot at the peak
    final dotPaint = Paint()..color = Colors.orange;
    final dotCenter = Offset(
      size.width * 0.76,
      size.height * 0.23,
    ); // Approximate peak location
    canvas.drawCircle(dotCenter, 4, dotPaint);

    // Draw white border around dot
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(dotCenter, 4, borderPaint);

    // Draw dotted grid lines (Optional, for detail)
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw a dashed line at bottom
    _drawDashedLine(
      canvas,
      gridPaint,
      Offset(0, size.height),
      Offset(size.width, size.height),
    );
  }

  void _drawDashedLine(Canvas canvas, Paint paint, Offset p1, Offset p2) {
    const int dashWidth = 5;
    const int dashSpace = 5;
    double startX = p1.dx;
    while (startX < p2.dx) {
      canvas.drawLine(
        Offset(startX, p1.dy),
        Offset(startX + dashWidth, p1.dy),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BottomButtonsCoinsDetails extends StatelessWidget {
  const BottomButtonsCoinsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromRGBO(255, 90, 85, 0.2)
                    : const Color(0xFFFFD8D8), // Light pink
                foregroundColor: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromRGBO(255, 90, 85, 1)
                    : const Color.fromRGBO(255, 64, 59, 1), // Red text
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(31.r),
                ),
              ),
              child: const Text("Sell", style: AppTextStyles.headingStyle18Po),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesContants.buyCrypto);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(31.r),
                ),
              ),
              child: Text(
                "Buy",
                style: AppTextStyles.headingStyle18Po.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StetRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;
  const StetRowWidget({
    super.key,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
              ),
      ),
      child: Row(
        children: [
          Text(label, style: AppTextStyles.xsMedium),
          const Gap(6),
          Icon(
            Icons.info_rounded,
            color: Theme.of(context).brightness == Brightness.dark
                ? Color.fromRGBO(96, 121, 250, 1)
                : Color.fromRGBO(71, 102, 249, 1),
            size: 12,
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.sMedium.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
