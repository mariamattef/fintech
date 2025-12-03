import 'package:fintech/core/config/assets.dart';
import 'package:fintech/features/onboarding/presentation/widgets/butttons_inboarding.dart';
import 'package:fintech/features/onboarding/presentation/widgets/dots_inboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/onBoarding';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  List<Map<String, String>> onboardingData = [
    {"image": AppAssets.onB1, "text": "Welcome to Crypto X"},
    {"image": AppAssets.onB2, "text": "Transaction Security "},
    {"image": AppAssets.onB3, "text": "Fast and reliable Market updated"},
    {"image": AppAssets.onB4, "text": "Get Started Now!"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Column(
            children: [
              Gap(30),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingData.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onboardingData[index]["image"]!, height: 250),
                      SizedBox(height: 20),
                      Text(
                        onboardingData[index]["text"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              currentIndex == onboardingData.length - 1
                  ? ButtonsInBoarding()
                  : DotsInBoardingWidget(
                      currentIndex: currentIndex,
                      onboardingData: onboardingData,
                      controller: _controller,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
