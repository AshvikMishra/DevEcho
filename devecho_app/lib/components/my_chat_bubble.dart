import 'package:devecho_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/tomorrow-night.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  bool isPythonCode(String text) {
    return text.trim().startsWith("def") || text.trim().contains("import") || text.trim().contains("print(") || text.trim().contains("input(");
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser
            ? Theme.of(context).colorScheme.inversePrimary
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: const Border(
          right: BorderSide(color: Colors.black, width: 2),
          bottom: BorderSide(color: Colors.black, width: 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: isPythonCode(message)
          ? HighlightView(
              message,
              language: 'python',
              theme: isDarkMode ? tomorrowNightTheme : githubTheme,
              padding: const EdgeInsets.all(8),
              textStyle: TextStyle(fontSize: 14),
            )
          : Text(
              message,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
    );
  }
}