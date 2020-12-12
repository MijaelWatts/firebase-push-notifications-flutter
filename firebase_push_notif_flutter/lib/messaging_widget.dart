import 'package:flutter/material.dart';
import 'package:firebase_push_app/message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final List<Message> messages = [];
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  /// Called once this widget is inserted into the tree
  @override
  void initState() {
    //Call the default initState() functionality and then perform the firebase stuff
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (Map message) async {
        final notification = message['notification'];
        setState(() {
          messages.add(
            Message(
              title: notification['title'],
              body: notification['body'],
            ),
          );
        });
      },
      onLaunch: (Map message) async {
        final notification = message['data'];
        setState(() {
          messages.add(Message(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });
      },
      onResume: (Map message) async {
        final notification = message['data'];
        setState(() {
          messages.add(Message(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  ListView build(BuildContext context) {
    return ListView(
      children: messages.map(buildMessage).toList(),
    );
  }

  ListTile buildMessage(Message message) {
    return ListTile(
      tileColor: Colors.deepPurple,
      title: Text(message.title),
      subtitle: Text(message.body),
    );
  }
}
