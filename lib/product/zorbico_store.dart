import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZorbicoStore extends ChangeNotifier {
  int lastRoll = 0;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    lastRoll = prefs.getInt('lastRoll') ?? 0;
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> setRoll(int roll) async {
    lastRoll = roll;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastRoll', roll);
    notifyListeners();
  }
}
