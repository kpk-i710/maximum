import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/widgets/app_icon.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../styles.dart';

class MapPage extends StatelessWidget {
  final web = '''
  <header>
      <script src="https://maps.api.2gis.ru/2.0/loader.js?pkg=full"></script>
    </header>
    <body>
      <div id="map" style="width: 100%; height: 100%;"></div>
      <script type="text/javascript">
    
        function clck() { 
          _callBack.postMessage('[40.533773, 72.798184]'); 
        }
    
        function checkLoc(lat, lng) {
          if (lat == 0) lat = 40.533773;
          if (lng == 0) lng = 72.798184;
          return [lat, lng];
        }
    
        DG.then(function () {
          var map, marker;
          map = DG.map('map', {
            center: checkLoc(40.533773, 72.798184),
            zoom: 15,
            fullscreenControl: false,
            zoomControl: false
          });
    
          marker = DG.marker(checkLoc(40.533773, 72.798184)).addTo(map);
        });
      </script>
    </body>
  ''';

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  JavascriptChannel _callBackJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: '_callBack',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Builder(builder: (BuildContext context) {
                return WebView(
                  initialUrl: 'data:text/html,$web',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) async {
                    _controller.complete(webViewController);
                  },
                  javascriptChannels: <JavascriptChannel>[
                    _callBackJavascriptChannel(context),
                  ].toSet(),
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url.startsWith('https://www.youtube.com/')) {
                      print('blocking navigation to $request}');
                      return NavigationDecision.prevent;
                    }
                    print('allowing navigation to $request');
                    return NavigationDecision.navigate;
                  },
                  onPageStarted: (String url) {
                    print('Page started loading: $url');
                  },
                  onPageFinished: (String url) {
                    print('Page finished loading: $url');
                  },
                  gestureNavigationEnabled: true,
                );
              })
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.theme.primary,
                  border: Border.all(
                    color: context.theme.primary,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  color: context.theme.background,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 6),
                              hintText: 'address_or_object'.tr,
                              hintStyle: AppTextStyles.roboto(
                                  color: context.theme.mainTextColor.withOpacity(0.6),
                                  fontSize: 18),
                              labelStyle: AppTextStyles.roboto(fontSize: 18),
                              prefixIcon: AppIcon(AppIcons.search,
                                  color: context.theme.greyMedium),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: context.theme.accent.withOpacity(0.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: context.theme.accent.withOpacity(0.0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: context.theme.accent.withOpacity(0.0),
                                ),
                              ),
                            ),
                            style: AppTextStyles.roboto(fontSize: 18),
                            onSubmitted: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}