
import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Align(
        alignment: Alignment(0, 0),
        child: Text(
          '00:00',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
