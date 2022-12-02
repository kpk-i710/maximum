import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../../../../../widgets/widgets.dart' as widgets;

class AddAdress extends StatelessWidget {
  const AddAdress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'add_address'.tr,
          style: widgets.robotoConsid(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: widgets.themeChangeAdress(child: widgets.pageChangeAdgress()),
    );
  }
}
