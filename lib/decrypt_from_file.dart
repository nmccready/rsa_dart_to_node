import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';

/*
Assumes were on the secure backend and utilizes the private key
to decrypt a message.

NOTE: test/msg should not have an extra line of base64 decode will fail!
*/
void main() async {
  final privKey = await parseKeyFromFile<RSAPrivateKey>('test/private_key.pem');

  final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  final encrypter = Encrypter(RSA(privateKey: privKey));

  final file = File('./test/msg');
  final encrypted = Encrypted.from64(await file.readAsString());

  final decrypted = encrypter.decrypt(encrypted);

  print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  final areEqual = plainText == decrypted;
  print('messages equality is $areEqual');
}
