import 'dart:async';
import 'dart:developer';

import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef DynamicCallback = void Function();

class CountdownService extends GetxService {
  final Duration duration;
  final TextStyle? textStyle;
  final DynamicCallback? onElapsed;
  CountdownService({
    required this.duration,
    this.onElapsed,
    this.textStyle,
  });

  late Duration? myDuration;
  late Timer? countdownTimer;
  var time = ''.obs;
  var isTimerActive = false.obs;
  var hasTimerElapsed = false.obs;

  Future<CountdownService> init() async {
    myDuration = duration;
    return this;
  }

  void startTimer() {
    if (!isTimerActive.value) {
      countdownTimer =
          Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
      isTimerActive(true);
    } else {
      log('Timer is already running...');
    }
    setTimeString();
  }

  void stopTimer() {
    countdownTimer!.cancel();

    myDuration = duration;
    isTimerActive(false);
    setTimeString();
  }

  void resetTimer() {
    stopTimer();
    // startTimer();
    myDuration = duration;
    setTimeString();
    hasTimerElapsed(false);
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = myDuration!.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      log('Timer ended...');
      countdownTimer!.cancel();
      isTimerActive(false);
      hasTimerElapsed(true);
      onElapsed!();
    } else {
      myDuration = Duration(seconds: seconds);
    }

    setTimeString();
  }

  void setTimeString() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays);
    // final hours = strDigits(myDuration!.inHours.remainder(24));
    final minutes = strDigits(myDuration!.inMinutes.remainder(60));
    final second = strDigits(myDuration!.inSeconds.remainder(60));

    time('$minutes:$second');
  }

  Widget display() {
    return Obx(() => Text(
          'Resend code in ${time.value}',
          style: textStyle ?? TypeUtil(weight: FontWeight.w500).body(),
        ));
  }
}
