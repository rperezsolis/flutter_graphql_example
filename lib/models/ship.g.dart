// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ship _$ShipFromJson(Map<String, dynamic> json) {
  return Ship(
    name: json['name'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$ShipToJson(Ship instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
