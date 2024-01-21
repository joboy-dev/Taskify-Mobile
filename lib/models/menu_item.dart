import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final Color textColor;
  final IconData icon;
  final Function() onTap;

  MenuItem({
    required this.text, 
    required this.textColor,
    required this.icon, 
    required this.onTap,
  });
}