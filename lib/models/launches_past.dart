import 'package:graphql_example/models/launch_site.dart';
import 'package:graphql_example/models/links.dart';
import 'package:graphql_example/models/rocket.dart';
import 'package:graphql_example/models/ship.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launches_past.g.dart';

@JsonSerializable(nullable: false)
class LaunchesPast {
  @JsonKey(name: 'mission_name')
  final String missionName;
  @JsonKey(name: 'launch_date_local')
  final DateTime launchDateLocal;
  @JsonKey(name: 'launch_site')
  final LaunchSite launchSite;
  final Links links;
  final Rocket rocket;
  final List<Ship> ships;

  LaunchesPast({this.missionName, this.launchDateLocal, this.launchSite, this.links, this.rocket, this.ships,});

  factory LaunchesPast.fromJson(Map<String, dynamic> json) => _$LaunchesPastFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchesPastToJson(this);
}
