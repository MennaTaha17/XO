import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:xo_game/common/app_colors.dart';
import 'package:xo_game/screens/home_screen.dart';
import 'package:xo_game/widgets/game_button.dart';

import '../widgets/timer_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  static const String routeName = 'gameScreen';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> gamelog = List.filled(9, '');
  int xScore = 0, oScore = 0;
  String? currentPlayer;
  @override
  Widget build(BuildContext context) {
    String firstPlayer = ModalRoute.of(context)!.settings.arguments.toString();
    if (currentPlayer == null) currentPlayer = firstPlayer;
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
          body:
              Column(
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
                            child: ScoreWidget(xScore: xScore, oScore: oScore),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Player ${currentPlayer}’s Turn',
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
                        builder: (context, constraints) {
                          double height = constraints.maxHeight;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: Container(
                              color: AppColors.blackColor,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 2,
                                      crossAxisSpacing: 2,
                                      mainAxisExtent: height / 3,
                                    ),
                                itemCount: 9,
                                itemBuilder:
                                    (context, index) => GameButton(
                                      value: gamelog[index],
                                      onTap: () => onButtonClicked(index),
                                    ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )!,
        ),
      ),
    );
  }

  onButtonClicked(int index) {
    if (gamelog[index].isEmpty) {
      gamelog[index] = currentPlayer!;
      bool didWin = checkWinner();
      if (didWin) {
        if (currentPlayer == 'x') {
          xScore++;
        } else {
          oScore++;
        }
        gamelog = List.filled(9, '');
        setState(() {});
        winnerDailoge();
        return;
      }
      if (currentPlayer == 'x') {
        currentPlayer = 'o';
      } else
        currentPlayer = 'x';
      setState(() {});
    }
  }

  bool checkWinner() {
    for (int i = 0; i <= 6; i += 3) {
      if (gamelog[i] == currentPlayer &&
          gamelog[i + 1] == currentPlayer &&
          gamelog[i + 2] == currentPlayer) {
        return true;
      } else if (gamelog[0] == currentPlayer &&
          gamelog[4] == currentPlayer &&
          gamelog[8] == currentPlayer) {
        return true;
      } else if (gamelog[2] == currentPlayer &&
          gamelog[4] == currentPlayer &&
          gamelog[6] == currentPlayer) {
        return true;
      } else {
        for (int i = 0; i <= 2; i++) {
          if (gamelog[i] == currentPlayer &&
              gamelog[i + 3] == currentPlayer &&
              gamelog[i + 6] == currentPlayer) {
            return true;
          }
        }
      }
    }
    return false;
  }

  winnerDailoge() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed:
                  () => Navigator.of(context).pushNamed(HomeScreen.routeName),
              child: Text("ok", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
          title: Row(
            children: [
              Text(
                "Congratulation",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.celebration,color: AppColors.blueColor,),
            ],
          ),
          content: Text(
            'The player $currentPlayer is the winner',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
