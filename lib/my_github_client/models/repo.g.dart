// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) => Repo()
  ..id = json['id'] as String
  ..name = json['name'] as String
  ..full_name = json['full_name'] as String
  ..owner = User.fromJson(json['owner'] as Map<String, dynamic>)
  ..parent = json['parent'] as String?
  ..private = json['private'] as bool
  ..description = json['description'] as String
  ..fork = json['fork'] as bool
  ..language = json['language'] as String?
  ..forks_count = json['forks_count'] as int
  ..stargazers_count = json['stargazers_count'] as int
  ..size = json['size'] as int
  ..default_branch = json['default_branch'] as String
  ..open_issues_count = json['open_issues_count'] as int
  ..pushed_at = json['pushed_at'] as String
  ..created_at = json['created_at'] as String
  ..updated_at = json['updated_at'] as String
  ..subscribers_count = json['subscribers_count'] as String?
  ..license = json['license'] == null
      ? null
      : License.fromJson(json['license'] as Map<String, dynamic>);

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.full_name,
      'owner': instance.owner.toJson(),
      'parent': instance.parent,
      'private': instance.private,
      'description': instance.description,
      'fork': instance.fork,
      'language': instance.language,
      'forks_count': instance.forks_count,
      'stargazers_count': instance.stargazers_count,
      'size': instance.size,
      'default_branch': instance.default_branch,
      'open_issues_count': instance.open_issues_count,
      'pushed_at': instance.pushed_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'subscribers_count': instance.subscribers_count,
      'license': instance.license?.toJson(),
    };
