import 'dart:math';

import 'package:flutter/material.dart';

// TODO extension?
void openPage(Widget page, BuildContext withContext) {
  Navigator.push(withContext, MaterialPageRoute(builder: (context) => page));
}

List<T> randomValues<T>(int amount, List<T> from, {T? excluding}) {
  List<T> result = [];

  var rnd = Random.secure();
  while (result.length < amount) {
    var index = rnd.nextInt(from.length);
    var randomElement = from[index];

    if (!result.contains(randomElement) && excluding != randomElement) {
      result.add(randomElement);
    }
  }

  return result;
}
