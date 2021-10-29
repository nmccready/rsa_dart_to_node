import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';

/*
Leaving this original example but it's bad in a sense for beginners to security.

IE: You would **almost** never have the need to load both keys at the same time
in memory.
*/
void main() async {
  final publicKey = await parseKeyFromFile<RSAPublicKey>('test/public_key.pem');
  final privKey = await parseKeyFromFile<RSAPrivateKey>('test/private_key.pem');

  final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privKey));

  final encrypted = encrypter.encrypt(plainText);
  final decrypted = encrypter.decrypt(encrypted);

  print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  print(encrypted.base64);
}
