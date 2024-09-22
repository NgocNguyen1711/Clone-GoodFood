import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final storage = createStorage();
  Storage._internal();
  static final _singleton = Storage._internal();
  factory Storage() => _singleton;

  static createStorage() {
    const storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
    return storage;
  }
}
