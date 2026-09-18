import 'package:flutter/material.dart';
import 'package:xo_game/common/app_const.dart';

import '../common/app_colors.dart';

class GameButton extends StatelessWidget {
  const GameButton({super.key, required this.value,required this.onTap});
  final String value;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.whiteColor,
        alignment: Alignment(0, 0),
        padding: EdgeInsets.all(10),
        child:
            value == 'x'
                ? Image.asset(AppConst.xImage)
                : value == 'o'
                ? Image.asset(AppConst.oImage)
                : SizedBox(),
      ),
    );
  }
}
