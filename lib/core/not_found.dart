import 'package:fintech/core/config/assets.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset(
          AppAssets.notfound,
          width: 250,
        ),
      ),
    );
  }
}