import 'package:flutter/material.dart';

class TotalValueCard extends StatelessWidget {
  const TotalValueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xff1d2d50), Color(0xff133b5c)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Total Value",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            "\$143,421.20",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "+2.5% (\$305.20) Today",
            style: TextStyle(
              color: Color(0xff4CD964),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
