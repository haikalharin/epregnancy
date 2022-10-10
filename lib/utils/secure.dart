
import 'package:encrypt/encrypt.dart';

final key = Key.fromUtf8('thisisepregnancy');
final iv = IV.fromLength(16);

String encrypt(String text){
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);

    print(encrypted.base64);
    return encrypted.base64;
}

String decrypty(String encryptedString) {
  final encrypter = Encrypter(AES(key));
  final decrypted = encrypter.decrypt(Encrypted.fromBase64(encryptedString), iv: iv);
  return decrypted;
}