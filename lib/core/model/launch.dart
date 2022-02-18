import 'package:flutterspacex/core/model/core.dart';
import 'package:flutterspacex/core/model/failures.dart';
import 'package:flutterspacex/core/model/links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Launch{
  Links? links;
  bool? success;
  List<Failures>? failures;
  String? details;
  String? launchpad;
  String? name;
  DateTime? dateUTC;
  List<Core>? cores;
  String id;

  Launch({this.links,this.success,this.failures,this.details,this.launchpad,this.name,this.dateUTC,this.cores,required this.id});

}