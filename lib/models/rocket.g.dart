// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rocket _$RocketFromJson(Map<String, dynamic> json) {
  return Rocket(
    name: json['rocket_name'] as String,
    rocketWikipedia:
        RocketWikipedia.fromJson(json['rocket'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'rocket_name': instance.name,
      'rocket': instance.rocketWikipedia,
    };
