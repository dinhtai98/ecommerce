import 'dart:convert';
import 'package:crypto/crypto.dart';

extension EncryptionExtension on String {
  String generateMd5() {
    return md5.convert(utf8.encode(this)).toString();
  }

  String encryptSha256() {
    return sha256.convert(utf8.encode(this)).toString();
  }
}
