import 'package:flutter/material.dart';
import 'package:xo_game/common/app_colors.dart';
import 'package:xo_game/common/app_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'homeScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.mainColor, AppColors.blueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Image.asset(AppConst.bgImage, fit: BoxFit.fill),
                    Center(
                      child: Text(
                        "Tix-Tac-Toe",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pick who goes first?",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: AppColors.whiteColor,
                                ),
                                child: Image.asset(
                                  AppConst.xImage,
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: AppColors.whiteColor,
                                ),
                                child: Image.asset(
                                  AppConst.oImage,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
