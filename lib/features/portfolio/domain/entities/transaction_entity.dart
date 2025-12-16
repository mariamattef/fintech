import 'package:flutter/material.dart';

class TransactionEntity {
  final String title;
  final String amount;
  final String time;
  final String value;
  final IconData icon;
  final Color iconColor;

  TransactionEntity({
    required this.title,
    required this.amount,
    required this.time,
    required this.value,
    required this.icon,
    required this.iconColor,
  });
}
