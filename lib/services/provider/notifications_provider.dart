import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsProvider extends ChangeNotifier {
  bool? _receiveNotifications = false;
  String key = 'receiveNotifications';

  bool get receiveNotifications => _receiveNotifications!;

   Future<void> _loadNotificationPreference() async {
    final prefs = await SharedPreferences.getInstance();
    
    // check against null value
    _receiveNotifications = prefs.getBool(key) ?? false;
    notifyListeners();
  }

  Future<void> toggleNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    _receiveNotifications = !_receiveNotifications!;
    prefs.setBool(key, _receiveNotifications!);
    notifyListeners();
  }

  NotificationsProvider() {
    _loadNotificationPreference();
  }
}