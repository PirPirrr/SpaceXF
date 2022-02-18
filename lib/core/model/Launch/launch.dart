
import 'package:flutterspacex/core/model/Launch/links.dart';
import 'package:json_annotation/json_annotation.dart';

import 'core.dart';
import 'failures.dart';

part 'launch.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Launch{
  Links? links;
  bool? success;
  List<Failures>? failures;
  String? details;
  String? launchpad;
  String? name;
  DateTime? date_local;
  List<Core>? cores;
  String id;

  Launch({this.links,this.success,this.failures,this.details,this.launchpad,this.name,this.date_local,this.cores,required this.id});

  factory Launch.fromJson(Map<String, dynamic> json) =>
      _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);

}