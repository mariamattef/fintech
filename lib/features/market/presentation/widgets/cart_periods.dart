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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((e) {
        final isActive = e == selected;
        return GestureDetector(
          onTap: () => onSelect(e),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xff1F6FEB) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isActive
                    ? const Color(0xff1F6FEB)
                    : Colors.grey.shade400,
              ),
            ),
            child: Text(
              e,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey.shade800,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
