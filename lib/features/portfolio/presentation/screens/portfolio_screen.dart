import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  static const String routeName = '/portfolio_screen';
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Portfolio Page'),
      ),
      
    );
  }
}