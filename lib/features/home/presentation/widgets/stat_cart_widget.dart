import 'package:flutter/material.dart';

class StatCartWidget extends StatelessWidget {
  final String title, value;
  final String? change;

  const StatCartWidget({
    super.key,
    required this.title,
    required this.value,
    this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (change != null) ...[
            const SizedBox(height: 5),
            Text(
              "$change ▴",
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Color(0xff6079FA)
                    : Color(0xff4766F9),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
