// ignore_for_file: file_names

import 'package:encrypt/encrypt.dart';

class Securty {
  final key = Key.fromUtf8("32*@jaskdl491%%@");
  Securty();

  String encrypt(String plainText) {
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  String dencrypt(String encrypted) {
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt64(encrypted, iv: iv);
    return decrypted;
  }
}
