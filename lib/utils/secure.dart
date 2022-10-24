
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

Future<String> aesDecryptor(String? encryptedValue) async {
  final key = Key.fromUtf8('ePregN4nCy1234!!');
  final iv = IV.fromUtf8("ePregN4nCy1234!!");

  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

  String decrypted = encrypter.decrypt(Encrypted.fromBase64(encryptedValue!), iv: iv);
  print('decrypted : $decrypted');
  return decrypted;
}

// Future<void> aesMethod() async {
//   const plainText = 'Fariz Fadian';
//
//   const test = "O78QdzDgtMS7zRXDky18Xg==";
//
//   final encrypter = aes.Encrypter(aes.AES(key, mode: aes.AESMode.cbc));
//
//   final encrypted = encrypter.encrypt(plainText, iv: iv);
//   print("encrypted : ${encrypted.base64}");
//   final decrypted = encrypter.decrypt(aes.Encrypted.fromBase64(test), iv: iv);
//   print("decrypted : " + decrypted);
// }