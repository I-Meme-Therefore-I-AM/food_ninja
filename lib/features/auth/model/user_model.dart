// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String uId;
  final String phone;
  UserModel({
    required this.uId,
    required this.phone,
  });

  UserModel copyWith({
    String? uId,
    String? phone,
  }) {
    return UserModel(
      uId: uId ?? this.uId,
      phone: phone ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uId': uId,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uId: map['uId'] as String,
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(uId: $uId, phone: $phone)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uId == uId &&
      other.phone == phone;
  }

  @override
  int get hashCode => uId.hashCode ^ phone.hashCode;
}
