// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rocket _$RocketFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Rocket',
      json,
      ($checkedConvert) {
        final val = Rocket(
          height: $checkedConvert(
              'height',
              (v) => v == null
                  ? null
                  : Height.fromJson(v as Map<String, dynamic>)),
          mass: $checkedConvert(
              'mass',
              (v) =>
                  v == null ? null : Mass.fromJson(v as Map<String, dynamic>)),
          flickr_images: $checkedConvert('flickr_images',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          name: $checkedConvert('name', (v) => v as String?),
          country: $checkedConvert('country', (v) => v as String?),
          company: $checkedConvert('company', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          id: $checkedConvert('id', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'height': instance.height?.toJson(),
      'mass': instance.mass?.toJson(),
      'flickr_images': instance.flickr_images,
      'name': instance.name,
      'country': instance.country,
      'company': instance.company,
      'description': instance.description,
      'id': instance.id,
    };
