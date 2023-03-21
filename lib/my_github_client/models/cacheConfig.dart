import 'package:json_annotation/json_annotation.dart';
part 'cacheConfig.g.dart';

@JsonSerializable()
class CacheConfig{
  CacheConfig();
  bool enable=true;
  int maxAge=1000;
  int maxCount=100;

  factory CacheConfig.fromJson(Map<String, dynamic> json) =>
      _$CacheConfigFromJson(json);
  Map<String, dynamic> toJson() => _$CacheConfigToJson(this);
}