import 'package:json_annotation/json_annotation.dart';

import 'patch.dart';

part 'links.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Links{
  Patch? patch;
  String? webcast;
  String? youtubeId;
  String? wikipedia;

  Links({this.patch,this.webcast,this.youtubeId,this.wikipedia});

  factory Links.fromJson(Map<String, dynamic> json) =>
      _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}