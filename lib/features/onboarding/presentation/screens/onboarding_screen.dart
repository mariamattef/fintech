import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routename = '/onBoarding';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  List<Map<String, String>> onboardingData = [
    {"image": "assets/images/onB1.png", "text": "Welcome to Crypto X"},
    {"image": "assets/images/onB2.png", "text": "Transaction Security "},
    {
      "image": "assets/images/onB3.png",
      "text": "Fast and reliable Market updated",
    },
    {"image": "assets/images/onB4.png", "text": "Get Started Now!"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Column(
            children: [
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

,,
              
              // Padding(
              //   padding: EdgeInsets.only(right: 20.h, left: 20.w, bottom: 20.h),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       // Next Button
              //       GestureDetector(
              //         onTap: () {
              //           if (currentIndex < onboardingData.length - 1) {
              //             _controller.nextPage(
              //               duration: Duration(milliseconds: 400),
              //               curve: Curves.easeInOut,
              //             );
              //           } else {
              //             Navigator.pushNamed(
              //               context,
              //               SettingsScreen.routeName,
              //             );
              //           }
              //         },
              //         child: Container(
              //           padding: EdgeInsets.all(12.r),
              //           decoration: BoxDecoration(
              //             color: Theme.of(context).colorScheme.primary,
              //             borderRadius: BorderRadius.circular(30.r),
              //           ),
              //           child: Icon(
              //             Icons.arrow_back_ios_new_outlined,
              //             size: 15.sp,
              //             color:
              //                 Theme.of(context).brightness == Brightness.light
              //                 ? AppColors.grey0
              //                 : AppColors.grey900,
              //           ),
              //         ),
              //       ),
              //       Row(
              //         children: List.generate(
              //           onboardingData.length,
              //           (index) => AnimatedContainer(
              //             duration: Duration(milliseconds: 300),
              //             margin: EdgeInsets.only(right: 5.w),
              //             width: currentIndex == index ? 23.w : 10.w,
              //             height: 5.h,
              //             decoration: BoxDecoration(
              //               color: currentIndex == index
              //                   ? Theme.of(context).colorScheme.primary
              //                   : Color(0xff494D58),

              //               borderRadius: BorderRadius.circular(10.r),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
         
         
         
            ],
          ),
        ],
      ),
    );
  }
}
