import 'package:graphql_example/models/launching.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launches_past_page.g.dart';

@JsonSerializable(nullable: false)
class LaunchesPastPage {
  final List<Launching> launchesPast;

  LaunchesPastPage({this.launchesPast});

  factory LaunchesPastPage.fromJson(Map<String, dynamic> json) => _$LaunchesPastPageFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchesPastPageToJson(this);
}