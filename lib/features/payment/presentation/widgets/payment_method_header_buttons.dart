import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodHeaderButtons extends StatelessWidget {
  final String visaSvg;
  final String masterSvg;
  final String appleSvg;

  const PaymentMethodHeaderButtons({
    super.key,
    required this.visaSvg,
    required this.masterSvg,
    required this.appleSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _singleButton(visaSvg,context),
        _singleButton(masterSvg,context),
        _singleButton(appleSvg,context),
      ],
    );
  }

  Widget _singleButton(String svgPath,context) {
    return SvgPicture.asset(svgPath, height: 30,);
  }
}
