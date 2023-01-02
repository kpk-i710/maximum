import 'package:flutter/material.dart';
import '../../widgets/widgets.dart' as widgets;

class NetWork extends StatelessWidget {
  const NetWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            body: Center(
                child: Text(
          "Нет интернета",
          style: widgets.robotoConsid(),
        ))));
  }
}
