import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  static const String routeName = '/market_screen';
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Market Page'),
      ),  
    );
  }
}