import 'package:flutter/material.dart';
import 'package:tukita_learner/widget/template.dart';

class SystemMessage extends StatelessWidget {
  final String message;
  final String details;

  const SystemMessage(this.message, {this.details = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(message)),
      body: MobileTemplate(body: Text(details)),
    );
  }
}
