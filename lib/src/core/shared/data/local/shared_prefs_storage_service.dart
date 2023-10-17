import 'dart:async';

import 'package:emp_ai_flutter_boilerplate/src/core/shared/data/local/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService implements StorageService {
  FlutterSecureStorage? storage;
  SharedPreferences? sharedPreferences;

  @override
  void init() {
    storage = const FlutterSecureStorage();
  }

  @override
  bool get hasInitialized => sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    return storage!.read(key: key);
  }

  @override
  Future<void> clear() async {
    await storage?.deleteAll();
  }

  @override
  Future<bool> has(String key) async {
    return await storage?.containsKey(key: key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    try {
      await storage?.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> set(String key, data) async {
    try {
      await storage!.write(key: key, value: data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
