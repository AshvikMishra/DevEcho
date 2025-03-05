import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GithubPage extends StatefulWidget {
  const GithubPage({super.key});

  @override
  _GithubPageState createState() => _GithubPageState();
}

class _GithubPageState extends State<GithubPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://github.com/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Github"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: WebViewWidget(controller: _controller),
        ),
      ),
    );
  }
}