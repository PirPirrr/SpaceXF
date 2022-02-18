import 'package:json_annotation/json_annotation.dart';

part 'core.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Core{
  int? flight;
  bool? landingAttempt;
  bool? landingSuccess;
  String? landpad;

  Core({this.flight,this.landingAttempt,this.landingSuccess,this.landpad});

  factory Core.fromJson(Map<String, dynamic> json) =>
      _$CoreFromJson(json);

  Map<String, dynamic> toJson() => _$CoreToJson(this);
}