import 'package:flutter/material.dart';
import 'package:firebase_push_app/messaging_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'Firebase Push Notification';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Push Notification',
      home: PushNotificationsApp(appTitle),
    );
  }
}

class PushNotificationsApp extends StatelessWidget {
  final String appTitle;

  PushNotificationsApp(this.appTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade600,
        centerTitle: true,
        title: Text(appTitle),
      ),
      body: MessagingWidget(),
    );
  }
}
