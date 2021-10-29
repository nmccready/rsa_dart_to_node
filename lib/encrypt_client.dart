import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';

// assume we're client side and only have PUB KEY to allow encryption
void main() async {
  final publicKey = await parseKeyFromFile<RSAPublicKey>('test/public_key.pem');

  final msg = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  // final encrypter = Encrypter(RSA(publicKey: publicKey));
  final encrypter = Encrypter(RSA(publicKey: publicKey));

  final encrypted = encrypter.encrypt(msg);

  print(encrypted.base64);
}
