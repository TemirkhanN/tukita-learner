import 'package:flutter/material.dart';
import 'package:tukita_learner/page/home.dart';

void main() {
  runApp(const MyApp());
  // disableBrowserRightClicks();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Routes are not recommended to be used by flutter official documentation
    return MaterialApp(
        // TODO adjust theme....
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)),
        home: HomePage());
  }
}
