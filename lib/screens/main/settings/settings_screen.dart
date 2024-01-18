import 'package:flutter/material.dart';
import 'package:taskify/screens/base_screen.dart';
import 'package:taskify/shared/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showAppBar: false,
      screen: Column(
        children: [
          Text(
            'Settings',
            style: kNormalTextStyle(context),
          )
        ],
      ),
    );
  }
}