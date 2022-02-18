import 'package:json_annotation/json_annotation.dart';

part 'failures.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Failures{
  int? time;
  String? reason;

  Failures({this.reason,this.time});

  factory Failures.fromJson(Map<String, dynamic> json) =>
      _$FailuresFromJson(json);

  Map<String, dynamic> toJson() => _$FailuresToJson(this);
}