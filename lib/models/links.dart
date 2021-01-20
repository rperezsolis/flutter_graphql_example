import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable(nullable: false)
class Links {
  @JsonKey(name: 'video_link')
  final String videoLink;

  Links({this.videoLink});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
