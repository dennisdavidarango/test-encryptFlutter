//import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:test_encrypt/test.dart';

void main() {
  final plainText = "adios";

  encrypt.Key key = encrypt.Key.fromUtf8("\$B&E)H@McQfTjWnZr4u7x!A%C*F-JaNd");
  encrypt.IV iv = encrypt.IV.fromUtf8("z%C*F-JaNdRgUkXp");
  final encrypter = encrypt.Encrypter(
      encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));

  final encrypted = encrypter.encrypt(plainText, iv: iv);
  final decrypted = encrypter.decrypt(encrypted, iv: iv);

  print(encrypted.base64);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: Test());
  }
}
