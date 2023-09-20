import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_connection_test/game/buttons_view.dart';
import 'package:number_connection_test/globals/gobals.dart';

class GameView extends StatelessWidget {
  const GameView({super.key, required this.startNum, required this.endNum});
  final int startNum;
  final int endNum;

  @override
  Widget build(BuildContext context) {
    int range = 50;
    // var randomLimit = range * range;
    var randomPicker = List<int>.generate(range, (startNum) => startNum + 1)
      ..shuffle();
    int num;
    gamingNumber = startNum - 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Game!'),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(
              maxHeight: 700, maxWidth: 800, minWidth: 400, minHeight: 400),
          margin: const EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 50),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white70.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              border: Border.all(
                  color: const Color.fromARGB(247, 186, 184, 184), width: 5.0)),
          child: Column(
            // children: [Board(key: const Key('main board'), setting: _boardSetting)],
            children: [
              for (var y = 0; y <= pow(range, 0.5); y++)
                Expanded(
                  child: Row(
                    children: [
                      for (var x = 0; x <= pow(range, 0.5); x++)
                        if (randomPicker.isNotEmpty)
                          if ((num = randomPicker.removeLast().toInt()) <=
                                  endNum &&
                              num >= startNum)
                            Expanded(
                              child: WrapperButton(
                                labelnum: num,
                                endnum: endNum,
                              ),
                            )
                          else
                            const Expanded(child: SizedBox.shrink())
                        else
                          const Expanded(child: SizedBox.shrink()),
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
