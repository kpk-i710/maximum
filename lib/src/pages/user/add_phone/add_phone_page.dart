import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles.dart';
import '../../../widgets/widgets.dart' as widgets;

class AddPhonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widgets.getThemeBorderGreyTextFild(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text('my_contacts'.tr,
                      style: widgets.robotoConsid(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 15),
                  widgets.selectRadio(
                      text: "+996 550 88 25 88",
                      index: 0,
                      isTelegram: true,
                      isWhatsUp: true),
                  widgets.selectRadio(
                      text: "+996 550 88 25 90", index: 1, isTelegram: true),
                  SizedBox(height: 20),
                  sizeTextFild(
                    child: TextFormField(
                      onSaved: (value) {},
                      validator: (value) {},
                      decoration: InputDecoration(
                        helperText: " ",
                        labelText: 'phone_number'.tr,
                      ),
                    ),
                  ),
                  Text("phone_number_has".tr),
                  Row(
                    children: [
                      widgets.checkBoxWithImage(
                          icon: Icon(Icons.whatsapp, color: Colors.green)),
                      SizedBox(width: 20),
                      widgets.checkBoxWithImage(
                          icon: Icon(Icons.telegram, color: Colors.blue)),
                    ],
                  ),

                  widgets.addAdressButton(text: "add_number".tr),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget sizeTextFild({required Widget child}) {
    return SizedBox(height: 70, child: child);
  }
}
