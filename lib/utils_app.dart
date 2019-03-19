import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class utils_app {

  final storage = new FlutterSecureStorage();

   encrypt_text(String plain) {
    var plainText = plain;
    var key = encrypt.Key.fromLength(32);
    var iv = encrypt.IV.fromLength(8);
    var encrypter = encrypt.Encrypter(encrypt.Salsa20(key, iv));

    var encrypted = encrypter.encrypt(plainText);
    return encrypted.base64;
  }

  String decrypt_text(cipher) {
    final key = encrypt.Key.fromLength(32);
    final iv = encrypt.IV.fromLength(8);
    final encrypter = encrypt.Encrypter(encrypt.Salsa20(key, iv));

    final decrypted = encrypter.decrypt64(cipher);

    return decrypted;
  }

  store_write(String key, String value) async {
    await storage.write(key: key, value: value);
  }

   store_read(String key) async {
     String value = await storage.read(key: key);
    return value;
  }

  store_delete(String key) async {
    return await storage.delete(key: key);
  }

  store_deleteall(String key) async {
    return await storage.deleteAll();
  }

}