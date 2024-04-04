import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class BuySimView extends StatefulWidget {
  final String buysimLink;

  const BuySimView({
    required this.buysimLink,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _BuySimViewState();
  }
}

class _BuySimViewState extends State<BuySimView> {
  late String buysimWvlnk;
  late WebViewController buysimWbController;

  @override
  void initState() {
    super.initState();
    buysimWvlnk = widget.buysimLink;
    log(buysimWvlnk);
    buysimWbController = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onUrlChange: (url) async {
            final buysimPrefs = await SharedPreferences.getInstance();
            final buysimCurrentUrl = url.url ?? '';
            buysimPrefs.setString('buysimKey', buysimCurrentUrl);
            final openInBrowser = buysimCurrentUrl.contains('.xlsx') ||
                buysimCurrentUrl.contains('.pdf') ||
                buysimCurrentUrl.contains('app/po-trade-broker') ||
                buysimCurrentUrl.contains('openbrowser=1');
            if (openInBrowser) {
              await launchUrl(
                Uri.parse(buysimCurrentUrl),
                mode: LaunchMode.externalApplication,
              );
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(buysimWvlnk))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
          'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3 like Mac OS X) AppleWebKit'
          '/605.1.15 (KHTML, like Gecko) Version/17.2 Mobile/15E148 Safari/604.1, webview_aso_ios_3');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          toolbarHeight: 0,
          // leading: GestureDetector(
          //   onTap: () async {
          //     if (await buysimWbController.canGoBack()) {
          //       // await buysimWbController.goBack();
          //       print(true);
          //     }
          //   },
          //   child: const Icon(
          //     CupertinoIcons.back,
          //     color: Colors.white,
          //   ),
          // ),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          child: WebViewWidget(
            controller: buysimWbController,
          ),
        ),
      ),
    );
  }
}
