import 'package:fintech/core/config/assets.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
    static const String routeName = RoutesContants.notFound;
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