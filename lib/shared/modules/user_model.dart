import 'dart:convert';

class UserModal {
  final String name;
  final String? photoURL;

  UserModal({required this.name, this.photoURL});

  factory UserModal.fromMap(Map<String, dynamic> map) =>
      UserModal(name: map["name"], photoURL: map["photoURL"]);

  factory UserModal.fromJson(String json) =>
      UserModal.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {"name": name, "photoURL": photoURL};

  String toJson() => jsonEncode(toMap());
}
