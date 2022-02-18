import 'package:json_annotation/json_annotation.dart';

part 'height.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Height{
  int? meters;

  Height({this.meters});

  factory Height.fromJson(Map<String, dynamic> json) =>
      _$HeightFromJson(json);

  Map<String, dynamic> toJson() => _$HeightToJson(this);
}