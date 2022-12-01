import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intro_slider/intro_slider.dart';

import '../../helpers/app_router.dart';
import '../../helpers/prefs.dart';
import '../../styles.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  IntroPageState createState() => new IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  List<ContentConfig> slides = [];

  Function? goToTab;

  @override
  void initState() {
    super.initState();
    slides.add(
      new ContentConfig(
        title: "MAXKG",
        backgroundColor: Color(0xFF0C54A1),
        styleTitle: AppTextStyles.roboto(
            fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription:
            AppTextStyles.mPlusRounded1c(fontSize: 20.0, color: Colors.white),
        pathImage: 'assets/images/not_searched_yet.png',
      ),
    );
    slides.add(
      new ContentConfig(
        title: "MAXKG",
        backgroundColor: Color(0xfffe9c8f),
        styleTitle: AppTextStyles.roboto(
            fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold),
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription:
            AppTextStyles.mPlusRounded1c(fontSize: 20.0, color: Colors.white),
        pathImage: 'assets/images/fingers_id.png',
      ),
    );
    slides.add(
      new ContentConfig(
        title: "MAXKG",
        backgroundColor: Color(0xFF99FF99),
        styleTitle: AppTextStyles.roboto(
            fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription:
            AppTextStyles.mPlusRounded1c(fontSize: 20.0, color: Colors.white),
        pathImage: 'assets/images/nothing_found.png',
      ),
    );
  }

  void onDonePress() {
    Prefs.firstTime = false;
    Get.offNamed(AppRouter.main);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xFFD0103F),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xFFD0103F),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xFFD0103F),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      ContentConfig currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        color: currentSlide.backgroundColor,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage!,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title!,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: const EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description!,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: const EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      // slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Behavior
      scrollPhysics: BouncingScrollPhysics(),

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
