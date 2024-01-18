import 'package:flutter/material.dart';
import 'package:taskify/screens/main/base_nav_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseNavScreen(
      title: 'Notifications',
      icon: Icons.notifications_outlined,
      content: Column(
        children: [
          
        ],
      ),
    );
  }
}