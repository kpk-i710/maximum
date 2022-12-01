import 'package:flutter/material.dart';
import '../../widgets/widgets.dart'as widgets;

class popular_categories_item extends StatelessWidget {
  final index;

  const popular_categories_item({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<String> listData = [
      "microwave.png",
      "sofa.png",
      "sofa.png",
      "microwave.png",
      "sofa.png",
      "sofa.png",
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color(0xffD9D9D9).withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: index == 5 || index == 0
          ? Row(
              children: [
                SizedBox(width: 20),
                Flexible(
                    flex: 1,
                    child: Image.asset("assets/images/${listData[index]}")),
                Flexible(
                    flex: 1,
                    child: Center(
                        child: Text(
                      "Ноутбки",
                      style: widgets.robotoConsid(color: Color(0xff494949),fontSize: 16),
                    ))),
              ],
            )
          : Column(
              children: [
                Flexible(
                    flex: 3,
                    child: Center(
                        child:
                            Image.asset("assets/images/${listData[index]}"))),
                SizedBox(height: 20),
                Flexible(flex: 1, child: Text("Ноутбки",style: widgets.robotoConsid(fontSize: 16),)),
              ],
            ),
    );
  }
}
