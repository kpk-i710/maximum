

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart' as widgets;
class DiscoiuntCartHelp extends StatelessWidget {
  const DiscoiuntCartHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  widgets.boxShadows(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("specialist_help".tr,style: widgets.robotoConsid(),),
                SizedBox(height: 5),
                Text(
                  "Ноутбуки",
                  style: widgets.robotoConsid(
                    color: Color(0xff142A65),
                  ),
                ),
                SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "daria".tr,
                        style: widgets.robotoConsid(
                            color: Color(0xff142A65),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    widgets.underLineDashed(
                        child: Text(
                          "write_a_message".tr,
                          style: widgets.robotoConsid(
                              color: Color(0xff142A65), height: 2),
                        )),
                    widgets.underLineDashed(
                        child: Text(
                          "call".tr,
                          style: widgets.robotoConsid(
                              color: Color(0xff142A65), height: 2),
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 23),
          SizedBox(
              width: 70,
              child:
              Image.asset("assets/images/daria.png", width: 60))
        ],
      ),
    );
  }
}
