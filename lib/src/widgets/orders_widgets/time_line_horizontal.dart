import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLinesHorizontal extends StatelessWidget {
  TimeLinesHorizontal({Key? key}) : super(key: key);

  List<String> defaultValue = [
    "yes",
    "yes",
    "yes",
    "between",
    "between",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 40,
              child: TimelineTile(
                axis: TimelineAxis.horizontal,
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
        ),
      ),
    );
  }
}
