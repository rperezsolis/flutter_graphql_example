import 'package:json_annotation/json_annotation.dart';

part 'ship.g.dart';

@JsonSerializable(nullable: false)
class Ship {
  final String name;
  final String image;

  Ship({this.name, this.image});

  factory Ship.fromJson(Map<String, dynamic> json) => _$ShipFromJson(json);
  Map<String, dynamic> toJson() => _$ShipToJson(this);
}
