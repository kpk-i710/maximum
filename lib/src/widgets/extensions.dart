import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension CustomWidgetExtensions on Widget {
  Widget padding(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget margin(EdgeInsets margin) {
    return Container(
      margin: margin,
      child: this,
    );
  }

  Widget clickable(void Function() action, {bool opaque = true}) {
    return GestureDetector(
      behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
      onTap: action,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        opaque: opaque ?? false,
        child: this,
      ),
    );
  }
}
