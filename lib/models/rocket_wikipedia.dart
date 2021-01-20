import 'package:json_annotation/json_annotation.dart';

part 'rocket_wikipedia.g.dart';

@JsonSerializable(nullable: false)
class RocketWikipedia {
  final String wikipedia;

  RocketWikipedia({this.wikipedia});

  factory RocketWikipedia.fromJson(Map<String, dynamic> json) => _$RocketWikipediaFromJson(json);
  Map<String, dynamic> toJson() => _$RocketWikipediaToJson(this);
}