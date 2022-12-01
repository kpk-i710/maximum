import 'package:flutter/material.dart';

import 'bestsellers_widget.dart';

class BestsellersCarouselWidget extends StatelessWidget {
  const BestsellersCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100, maxHeight: 310),

      // constraints: BoxConstraints(maxHeight: 350, minHeight: 200.0),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return BestsellersItemWidget();
          }),
    );
  }
}
