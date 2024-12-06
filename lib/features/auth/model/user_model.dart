// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String uId;
  final String phoneNumber;
  UserModel({
    required this.uId,
    required this.phoneNumber,
  });

  UserModel copyWith({
    String? uId,
    String? phoneNumber,
  }) {
    return UserModel(
      uId: uId ?? this.uId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uId': uId,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uId: map['uId'] as String,
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(uId: $uId, phoneNumber: $phoneNumber)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uId == uId &&
      other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode => uId.hashCode ^ phoneNumber.hashCode;
}
