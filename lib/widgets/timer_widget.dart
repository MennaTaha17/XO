
import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class ScoreWidget extends StatelessWidget {
  final  int xScore,oScore;
  const ScoreWidget({
    super.key,
    required this.xScore,
    required this.oScore,
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
          '$xScore:$oScore',
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
