import 'package:flutter/material.dart';

class MenuItem {
  Widget? leading;
  String? title;
  String? page;
  Function()? onPressed;

  MenuItem({this.leading, this.title, this.page, this.onPressed});
}
