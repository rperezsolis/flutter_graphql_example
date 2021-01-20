import 'package:graphql_example/models/rocket_wikipedia.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rocket.g.dart';

@JsonSerializable(nullable: false)
class Rocket {
  @JsonKey(name: 'rocket_name')
  final String name;
  @JsonKey(name: 'rocket')
  final RocketWikipedia rocketWikipedia;

  Rocket({this.name, this.rocketWikipedia});

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);
  Map<String, dynamic> toJson() => _$RocketToJson(this);
}
