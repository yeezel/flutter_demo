import 'package:flutter_demo/my_github_client/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

import 'license.dart';
part 'repo.g.dart';

@JsonSerializable(explicitToJson: true)
class Repo{
  Repo();
  String id = "";
  String name = "";
  String full_name = "";
  late User owner;
  String? parent;
  bool private = false;
  String description = "";
  bool fork = false;
  String? language = "";
  int forks_count = 0;
  int stargazers_count = 0;
  int size = 0;
  String default_branch  = "";
  int open_issues_count = 0;
  String pushed_at = "";
  String created_at = "";
  String updated_at = "";
  String? subscribers_count;
  License? license;

  factory Repo.fromJson(Map<String, dynamic> json) =>
      _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}