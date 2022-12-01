import 'dart:convert';

class Token {
  String? access;

  Token({this.access});

  Token.fromMap(map) {
    access = map['access_token'];
  }

  Map<String, dynamic> toMap() => {
    'access_token': access,
  };

  static Token fromString(String val) {
    try {
      return Token.fromMap(jsonDecode(val));
    } catch(e) {
      return Token();
    }
  }

  @override
  String toString() => '{"access_token":"$access"}';
}