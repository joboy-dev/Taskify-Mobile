import 'package:flutter/material.dart';
import 'package:taskify/screens/main/base_nav_screen.dart';
import 'package:taskify/shared/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseNavScreen(
      title: 'Settings',
      icon: Icons.settings_outlined,
      content: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [

        ],
      ),
    );
  }
}