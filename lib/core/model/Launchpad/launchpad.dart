import 'package:json_annotation/json_annotation.dart';

part 'launchpad.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Launchpad{
  String? name;
  double latitude;
  double longitude;
  String id;

  Launchpad({this.name, required this.latitude,required this.longitude,required this.id});

  factory Launchpad.fromJson(Map<String, dynamic> json) =>
      _$LaunchpadFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchpadToJson(this);
}