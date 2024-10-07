import 'package:flutter/material.dart';

class SystemMessage extends StatelessWidget {
  final String message;
  final String details;

  const SystemMessage(this.message, {this.details = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(message)),
      body: Text(details),
    );
  }
}
