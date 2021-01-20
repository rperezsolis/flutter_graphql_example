import 'package:json_annotation/json_annotation.dart';

part 'launch_site.g.dart';

@JsonSerializable(nullable: false)
class LaunchSite {
  @JsonKey(name: 'site_name_long')
  final String siteNameLong;

  LaunchSite({this.siteNameLong});

  factory LaunchSite.fromJson(Map<String, dynamic> json) => _$LaunchSiteFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchSiteToJson(this);
}
