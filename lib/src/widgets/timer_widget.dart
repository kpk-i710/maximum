import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_machine/time_machine.dart';

class _TimerWidgetController extends GetxController {
  late int hours;
  late int minutes;
  late int seconds;

  final DateTime toDate;

  _TimerWidgetController({required this.toDate}) {
    Period period = LocalDateTime.now().periodUntil(LocalDateTime
        .dateTime(toDate));

    hours = period.hours;
    minutes = period.minutes;
    seconds = period.seconds;
  }

  @override
  void onReady() {
    super.onReady();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        if (minutes == 0) {
          if (hours > 0) {
            hours--;
          } else {
            timer.cancel();
          }
          minutes = 59;
        } else {
          minutes--;
        }
        seconds = 59;
      } else {
        seconds--;
      }
      update();
    });
  }
}

class TimerWidget extends StatelessWidget {
  final DateTime toDate;

  const TimerWidget({required this.toDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              GetBuilder<_TimerWidgetController>(
                  init: _TimerWidgetController(toDate: toDate),
                  builder: (value) => timerDigitsWidget('${value.hours}')),
              Text('hours'.tr, style: GoogleFonts.mPlusRounded1c(fontSize: 12)),
            ],
          ),
          Text(':',
              style: GoogleFonts.mPlusRounded1c(
                  fontSize: 22, fontWeight: FontWeight.bold)),
          Column(
            children: [
              GetBuilder<_TimerWidgetController>(
                  builder: (value) => timerDigitsWidget('${value.minutes}')),
              Text('minute'.tr, style: GoogleFonts.mPlusRounded1c(fontSize: 12)),
            ],
          ),
          Text(':',
              style: GoogleFonts.mPlusRounded1c(
                  fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              GetBuilder<_TimerWidgetController>(
                  builder: (value) => timerDigitsWidget('${value.seconds}')),
              Text('seconds'.tr, style: GoogleFonts.mPlusRounded1c(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget timerDigitsWidget(String digits) {
    digits = (int.tryParse(digits) ?? 0) > 9 ? digits : '0$digits';
    return Row(
      children: digits.split('').map((value) {
        return Card(
          elevation: 5,
          color: Colors.black,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
            child: Text(value,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
