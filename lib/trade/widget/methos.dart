import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const double _initialBalance = 1000;
  static ValueNotifier<double> balanceNotifier = ValueNotifier(_initialBalance);

  static const _keyBalance = 'balance';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setBalance(double balance) async {
    await _preferences?.setDouble(_keyBalance, balance);
  }

  static double getBalance() {
    return _preferences?.getDouble(_keyBalance) ?? _initialBalance;
  }
}