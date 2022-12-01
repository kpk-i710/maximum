import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLinesVertical extends StatelessWidget {
  TimeLinesVertical({Key? key}) : super(key: key);

  List<String> defaultValue = [
    "yes",
    "yes",
    "yes",
    "between",
    "between",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 42,
          child: TimelineTile(
            axis: TimelineAxis.vertical,
            indicatorStyle: IndicatorStyle(
              indicatorXY: 0.0,
              indicator: index == 4
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Color(0xff0C54A1), width: 2)),
                    )
                  : null,
              width: 7,
              height: 7,
              padding: EdgeInsets.all(2),
              color: defaultValue[index] == "yes"
                  ? Color(0xff0C54A1)
                  : Colors.grey,
            ),
            beforeLineStyle: LineStyle(
              color: defaultValue[index] == "yes"
                  ? Color(0xff0C54A1)
                  : Colors.grey,
              thickness: 3,
            ),
            afterLineStyle: LineStyle(
              color: defaultValue[index] == "yes"
                  ? Color(0xff0C54A1)
                  : Colors.grey,
              thickness: 3,
            ),
            isFirst: index == 0,
            isLast: index == 4,
          ),
        );
      },
    );
  }
}
