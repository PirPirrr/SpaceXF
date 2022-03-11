import 'package:json_annotation/json_annotation.dart';

part 'landpad.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Landpad{
  String id;
  String? name;
  double latitude;
  double longitude;

  Landpad({this.name,required this.id,required this.longitude, required this.latitude});

  factory Landpad.fromJson(Map<String, dynamic> json) =>
      _$LandpadFromJson(json);

  Map<String, dynamic> toJson() => _$LandpadToJson(this);

}