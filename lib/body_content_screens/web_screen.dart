import 'package:flutter/material.dart';
import 'package:magazine_new_app/app_bloc/app_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebScreen extends StatelessWidget {
   WebScreen({super.key});
  String url="";
  late final WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
     listener: (context, state) {},
     builder: (context, state) {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print('Navigation request to: ${request.url}');
            if (request.url.contains('success') || request.url.contains('callback')) {
              print('Payment completed successfully!');
              // Handle successful payment
              return NavigationDecision.prevent;
            }
            else if (request.url.contains('error') || request.url.contains('fail')) {
              print('Payment failed!');
              // Handle failed payment
              return NavigationDecision.prevent;
            }
            // Block YouTube navigation as in original
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),)..addJavaScriptChannel('Toaster', onMessageReceived: (JavaScriptMessage message) {ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.message)),);},);
      // Load the payment iframe URL
      _controller.loadRequest(Uri.parse(state.urlOfArticle));
    return SizedBox(
        width: double.infinity,
        child: WebViewWidget(
          controller: _controller,
        ));
  },
);
  }
}