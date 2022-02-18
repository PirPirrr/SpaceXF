import 'package:flutterspacex/core/model/Rocket/mass.dart';
import 'package:json_annotation/json_annotation.dart';

import 'height.dart';

part 'rocket.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Rocket{
  Height? height;
  Mass? mass;
  List<String>? flickr_images;
  String? name;
  String? country;
  String? company;
  String? description;
  String id;

  Rocket({this.height,this.mass,this.flickr_images,this.name,this.country,this.company,this.description,required this.id});

  factory Rocket.fromJson(Map<String, dynamic> json) =>
      _$RocketFromJson(json);

  Map<String, dynamic> toJson() => _$RocketToJson(this);
}