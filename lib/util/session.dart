import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Session {
  Future<void> saveSession(List<String> authToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('authUser', authToken);
  }

  getSessionUser() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getStringList('authUser');
    return authToken;
  }

  Future<bool> isSessionActive() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getStringList('authUser');
    return authToken != null;
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authUser');
  }
}
