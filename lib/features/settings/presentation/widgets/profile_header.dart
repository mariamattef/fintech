import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
final  Widget? child;
 final ImageProvider<Object>? backgroundImage;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.backgroundImage, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 45.r, backgroundImage:backgroundImage,
           child: child,
          
          ),
          Gap(10),
          Text(
            name,
            style: AppTextStyles.headingH5.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
