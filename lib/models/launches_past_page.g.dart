// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launches_past_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchesPastPage _$LaunchesPastPageFromJson(Map<String, dynamic> json) {
  return LaunchesPastPage(
    launchesPast: (json['launchesPast'] as List)
        .map((e) => Launching.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LaunchesPastPageToJson(LaunchesPastPage instance) =>
    <String, dynamic>{
      'launchesPast': instance.launchesPast,
    };
