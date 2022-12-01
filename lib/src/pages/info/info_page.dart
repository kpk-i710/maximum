import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

import '../../pages/info/info_page_controller.dart';
import '../../styles.dart';

class _InfoPageParams {
  final String title;
  final String url;
  const _InfoPageParams({this.title = '', this.url = ''});
}

class InfoPage extends StatelessWidget {
  static const _InfoPageParams DELIVERY_AND_TERMS = _InfoPageParams(
      title: 'delivery_and_terms', url: 'dost');
  static const _InfoPageParams PAYMENT_AND_INSTALLMENTS = _InfoPageParams(
      title: 'payment_and_installments', url: 'opl');
  static const _InfoPageParams PICKUP_POINTS = _InfoPageParams(
      title: 'pickup_points', url: 'dost');
  static const _InfoPageParams ORGANIZATIONS_AND_BUSINESS = _InfoPageParams(
      title: 'organizations_and_business', url: 'site/org');
  static const _InfoPageParams FAQ = _InfoPageParams(
      title: 'faq', url: 'page/14');
  static const _InfoPageParams ABOUT_COMPANY = _InfoPageParams(
      title: 'about_company', url: 'page/7');
  static const _InfoPageParams CONTACTS = _InfoPageParams(
      title: 'contacts', url: 'cont');
  static const _InfoPageParams SALES_RULES = _InfoPageParams(
      title: 'sale_rules', url: 'page/10');
  static const _InfoPageParams SUPPLIERS_AND_MANUFACTURERS = _InfoPageParams(
      title: 'suppliers_and_manufacturers', url: 'page/15');
  static const _InfoPageParams VACANCY = _InfoPageParams(
      title: 'vacancy', url: 'page/11');

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  final _InfoPageParams _params;

  InfoPage(this._params, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: context.theme.background,
        leading: BackButton(color: Colors.black),
        title: Text(
          _params.title.tr,
          style: AppTextStyles.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<InfoPageController>(
          init: InfoPageController(_params.url),
          builder: (controller) => AnimatedSwitcher(
            duration: Duration(milliseconds: 1000),
            child: controller.loading
                ? Center(
                  child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      context.theme.accent)),
                )
                : WebView(
                  initialUrl: 'data:text/html, ${controller.html}',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) async {
                    _controller.complete(webViewController);
                  },
                  gestureNavigationEnabled: true,
                ),
          ),
        ),
      ),
    );
  }
}
