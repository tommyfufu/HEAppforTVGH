import 'package:flutter/material.dart';
import 'package:number_connection_test/game/game_ending_view.dart';
import 'package:number_connection_test/globals/gobals.dart';
import 'package:number_connection_test/utilities/dialogs/error_dialog.dart';

class WrapperButton extends StatefulWidget {
  const WrapperButton({
    super.key,
    required this.labelnum,
    required this.endnum,
  });
  final int labelnum;
  final int endnum;
  @override
  State<WrapperButton> createState() => _WrapperButtonState();
}

class _WrapperButtonState extends State<WrapperButton> {
  // var _pressedFlag = {'notPressed': 0, 'firstPressed':1, 'pressAgain':2 };
  bool _pressedFlag = false;

  void _changeButtonStateandCheckEnding(int nowValue, int endValue) {
    if (gamingNumber == (nowValue - 1)) {
      setState(() {
        _pressedFlag = true;
        gamingNumber = nowValue;
      });
      if (nowValue == endValue) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const GameOverView()));
      }
    } else {
      setState(() {
        _pressedFlag = false;
      });
      showErrorDialog(context, 'Wrong order!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: const Alignment(0.0, 0.0),
          shape: const CircleBorder(),
          // padding: const EdgeInsets.all(15.0),
          backgroundColor: _pressedFlag ? Colors.red : Colors.green,
          foregroundColor: Colors.white,
          shadowColor: const Color.fromARGB(247, 186, 184, 184),
          textStyle: const TextStyle(
            fontSize: 11.2,
            fontWeight: FontWeight.bold,
          ),
          side: _pressedFlag
              ? const BorderSide(color: Colors.red, width: 1.5)
              : const BorderSide(color: Colors.green, width: 1.5),
          // minimumSize: const Size(10, 10),
          // maximumSize: const Size(50, 50),
          // textStyle: const TextStyle(fontSize: 11, fontStyle: FontStyle.normal),
          // disabledBackgroundColor: Colors.red,
          // disabledForegroundColor: Colors.white,
        ),
        onPressed: () {},
        onLongPress: () {
          _changeButtonStateandCheckEnding(
            widget.labelnum,
            widget.endnum,
          );
        },
        child: Text(
          widget.labelnum.toString(),
        ),
      )),
    );
  }
}
