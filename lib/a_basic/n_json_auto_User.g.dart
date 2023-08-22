// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'n_json_auto_User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['a_name'],
  );
  return User(
    json['a_name'] as String,
    json['email'] as String,
    Address.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'a_name': instance.name,
      'email': instance.email,
      'address': instance.address.toJson(),
    };
