import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:xo_game/common/app_colors.dart';

import '../widgets/timer_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});
  static const String routeName = 'gameScreen';
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
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TimerWidget(),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Player 1’s Turn',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LayoutBuilder(
                    builder: (context,constraints) {
                      double height = constraints.maxHeight;
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Container(
                            color: AppColors.blackColor,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2,
                              mainAxisExtent: height/3
                            ),
                            itemCount: 9,
                            itemBuilder: (context, index) => Container(color: AppColors.whiteColor,),
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
