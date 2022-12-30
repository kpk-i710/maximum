import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/styles.dart';
import '../widgets.dart' as widgets;

class DetailCartHelp extends StatelessWidget {
  const DetailCartHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return widgets.boxShadows(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "specialist_help".tr,
                    style: widgets.robotoConsid(),
                    children: const <TextSpan>[
                      TextSpan(text: 'Ноутбуки', style: TextStyle(fontSize: 14,color:   AppTextStyles.colorBlueMy)),

                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "daria".tr,
                    style: widgets.robotoConsid(
                        color: AppTextStyles.colorBlueMy, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widgets.customButton(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SvgPicture.asset(
                                  "assets/icons/correspond.svg",
                                  width: 15,
                                ),
                              ),
                              SizedBox(width: 8),
                              widgets.underLineDashed(
                                  child: Text(
                                "write_a_message".tr,
                                style: widgets.robotoConsid(
                                    color: AppTextStyles.colorBlueMy,
                                    height: 2),
                              )),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    widgets.customButton(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SvgPicture.asset(
                                "assets/icons/call.svg",
                                width: 15,
                              ),
                            ),
                            SizedBox(width: 8),
                            widgets.underLineDashed(
                                child: Text(
                              "call".tr,
                              style: widgets.robotoConsid(
                                  color: AppTextStyles.colorBlueMy, height: 2),
                            )),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 23),
          SizedBox(
              width: 70,
              child: Image.asset("assets/images/daria.png", width: 60))
        ],
      ),
    );
  }
}
