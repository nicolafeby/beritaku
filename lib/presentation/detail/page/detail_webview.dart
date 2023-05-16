import 'package:beritaku/core/model/argument/detail_arg.dart';
import 'package:beritaku/core/utils/app_constant.dart';
import 'package:beritaku/core/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatelessWidget {
  final DetailArg arg;
  const WebViewContainer({
    super.key,
    required this.arg,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: ColorConstant.light900,
        iconThemeData: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Detail',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ColorConstant.primary900,
              ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: arg.url,
            ),
          )
        ],
      ),
    );
  }
}
