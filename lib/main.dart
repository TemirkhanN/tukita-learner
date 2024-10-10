import 'package:flutter/material.dart';
import 'package:tukita_learner/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Routes are not recommended to be used by flutter official documentation
    return MaterialApp.router(
      routerConfig: router,
      // TODO adjust theme....
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
          textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 12),
            bodyMedium: TextStyle(fontSize: 14),
            bodyLarge: TextStyle(fontSize: 16),
          )),
    );
  }
}
