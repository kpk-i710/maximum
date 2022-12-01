import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIcons {
  add_block,
  amazon_pay,
  avatar_outlined_badged,
  bus,
  cancel,
  car_ride,
  cart,
  chat,
  check_list,
  checkbox_list_line,
  city,
  comment_outlined,
  conversation,
  currency,
  discount,
  edit_alt,
  fav_outlined,
  fav_red,
  fav_white,
  filter,
  flag_en,
  flag_kg,
  flag_ru,
  flag_uz,
  in_cart,
  info,
  like_outlined,
  list_check,
  location,
  mic,
  minus_outlined,
  notification,
  payment,
  payment_filled,
  people,
  person,
  phone_call,
  plus_outlined,
  profile_circle_outlined,
  qa,
  search,
  share,
  shop,
  sort,
  youtube,
  store,
  phone_circle,
}

class AppIcon extends StatelessWidget {
  final AppIcons icon;
  final double size;
  final Color? color;

  const AppIcon(this.icon, {Key? key, this.size = 25, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String iconName = describeEnum(icon).toLowerCase();
    return Container(
      height: size,
      width: size,
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/' + iconName + '.svg',
          color: color ?? Color(0xff333333),
          height: size,
          width: size,
        ),
      ),
    );
  }

}
