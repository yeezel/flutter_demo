// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

License _$LicenseFromJson(Map<String, dynamic> json) => License()
  ..key = json['key'] as String
  ..name = json['name'] as String
  ..spdx_id = json['spdx_id'] as String
  ..url = json['url'] as String
  ..node_id = json['node_id'] as String;

Map<String, dynamic> _$LicenseToJson(License instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'spdx_id': instance.spdx_id,
      'url': instance.url,
      'node_id': instance.node_id,
    };
