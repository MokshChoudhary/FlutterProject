// ignore_for_file: file_names
import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

// class Securty {
//   final key = Key.fromUtf8("32*@jaskdl491%%@");
//   Securty();

//   String encrypt(String plainText) {
//     final iv = IV.fromLength(16);
//     final encrypter = Encrypter(
//       AES(key),
//     );
//     final encrypted = encrypter.encrypt(plainText, iv: iv);
//     return encrypted.base64;
//   }

//   void test(String base64CipherText) {
//     // Decrypt the ciphertext.
//     final cipherText = Encrypted.fromBase64(base64CipherText);
//     final decrypted =
//         Encrypter(AES(key)).decrypt(cipherText, iv: IV.fromLength(16));

//     // Print the decrypted string.
//     print(decrypted);
//   }

//   String dencrypt(String encrypted) {
//     final iv = IV.fromLength(16);
//     final encrypter = Encrypter(AES(key));
//     final decrypted = encrypter.decrypt64(encrypted, iv: iv);
//     return decrypted;
//   }
// }
class Security {
  Security();
// This should be in an env file in production
  final mySecret = '32*@jaskdl491**@';

  String encode(Uint8List bytes) {
    return base64.encode(bytes);
  }

  Uint8List decode(String base64String) {
    return base64.decode(base64String);
  }

  String encrypt(String plaintext) {
    final key = Key.fromUtf8(mySecret);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key, mode: AESMode.cfb64));

    final encrypted = encrypter.encrypt(plaintext, iv: iv);

    final ciphertext = Uint8List(16 + encrypted.bytes.length);
    ciphertext.setAll(0, iv.bytes);
    ciphertext.setAll(16, encrypted.bytes);

    return ciphertext.toString();
  }

  Uint8List decrypt(String plainText) {
    final ciphertext = String.fromCharCodes(plainText.codeUnits);
    var outputAsUint8List = Uint8List.fromList(ciphertext.codeUnits);

    final key = Key.fromUtf8(mySecret);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key, mode: AESMode.cfb64));

    final encrypted = Encrypted(outputAsUint8List);

    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return Uint8List.fromList(decrypted.codeUnits);
  }
}
