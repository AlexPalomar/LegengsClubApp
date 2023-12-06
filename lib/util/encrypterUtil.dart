import 'package:encrypt/encrypt.dart' as ency;

class EncrypterUtil{

  final key = ency.Key.fromUtf8("This 32 char key have 256 bits..");
  final iv = ency.IV.fromLength(16);

  //Method encrypt String to base64
  passEncrypt(var encryptArgument){
    final encrypter = ency.Encrypter(ency.AES(key));

    final encrypted = encrypter.encrypt(encryptArgument, iv: iv);
    return encrypted.base64;
  }

  //Method decrypt to String
  passDecrypt(var decryptArgument){
    final encrypter = ency.Encrypter(ency.AES(key));

    final decrypted = encrypter.decrypt(decryptArgument as ency.Encrypted, iv: iv);
    return decrypted;
  }
  void testEncrypt() {
    final plainText = 'hola';

    final key = ency.Key.fromUtf8("This 32 char key have 256 bits..");
    final iv = ency.IV.fromLength(16);
    final encrypter = ency.Encrypter(ency.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    
  }
}
