import 'package:flutter/material.dart';
import 'package:namer_app/widget/wordbook/wordbook.dart';

void main() {
  runApp(MyApp());
  // disableBrowserRightClicks();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Wordbook()
    );
  }
}
