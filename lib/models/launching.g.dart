// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launching.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launching _$LaunchingFromJson(Map<String, dynamic> json) {
  return Launching(
    missionName: json['mission_name'] as String,
    launchDateLocal: DateTime.parse(json['launch_date_local'] as String),
    launchSite:
        LaunchSite.fromJson(json['launch_site'] as Map<String, dynamic>),
    links: Links.fromJson(json['links'] as Map<String, dynamic>),
    rocket: Rocket.fromJson(json['rocket'] as Map<String, dynamic>),
    ships: (json['ships'] as List)
        .map((e) => Ship.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LaunchingToJson(Launching instance) => <String, dynamic>{
      'mission_name': instance.missionName,
      'launch_date_local': instance.launchDateLocal.toIso8601String(),
      'launch_site': instance.launchSite,
      'links': instance.links,
      'rocket': instance.rocket,
      'ships': instance.ships,
    };
