import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimerWidget extends StatefulWidget {
  const CountDownTimerWidget({
    super.key,
    required this.onTimeElapsed,
    required this.time,
  });
  final Function() onTimeElapsed;
  final int time;

  @override
  State<CountDownTimerWidget> createState() => _CountDownTimerWidgetState();
}

class _CountDownTimerWidgetState extends State<CountDownTimerWidget> {
  int timerStart = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timerStart = widget.time;
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (mounted) {
          if (timerStart == 0) {
            setState(() {
              timerStart = widget.time;
              timer.cancel();
              widget.onTimeElapsed.call();
            });
          } else {
            setState(() {
              timerStart--;
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Code expires in',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: '\t${secToMinutes(Duration(seconds: timerStart))}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
      ),
    );
  }

  String secToMinutes(Duration duration) {
    final mm = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final ss = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$mm : $ss';
  }
}
