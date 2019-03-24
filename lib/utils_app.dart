import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class utils_app {

  static final String username = "Chatbot.Integration";
  static final password = "India@123";
  final storage = new FlutterSecureStorage();

  final String basicAuth =
    'Basic ' + base64Encode(utf8.encode('$username:$password'));

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
}