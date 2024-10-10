import 'package:flutter/cupertino.dart';

class MobileTemplate extends StatelessWidget {
  static const double maxWidth = 800;
  final Widget body;

  const MobileTemplate({required this.body});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var width =
          constraints.maxWidth > maxWidth ? maxWidth : constraints.maxWidth;

      return Center(
          child: Container(
              width: width,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              child: body));
    });
  }
}
