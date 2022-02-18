// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Launch',
      json,
      ($checkedConvert) {
        final val = Launch(
          links: $checkedConvert(
              'links',
              (v) =>
                  v == null ? null : Links.fromJson(v as Map<String, dynamic>)),
          success: $checkedConvert('success', (v) => v as bool?),
          failures: $checkedConvert(
              'failures',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Failures.fromJson(e as Map<String, dynamic>))
                  .toList()),
          details: $checkedConvert('details', (v) => v as String?),
          launchpad: $checkedConvert('launchpad', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          rocket: $checkedConvert('rocket', (v) => v as String),
          date_local: $checkedConvert('date_local',
              (v) => v == null ? null : DateTime.parse(v as String)),
          cores: $checkedConvert(
              'cores',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Core.fromJson(e as Map<String, dynamic>))
                  .toList()),
          id: $checkedConvert('id', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'success': instance.success,
      'failures': instance.failures?.map((e) => e.toJson()).toList(),
      'details': instance.details,
      'launchpad': instance.launchpad,
      'name': instance.name,
      'rocket': instance.rocket,
      'date_local': instance.date_local?.toIso8601String(),
      'cores': instance.cores?.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };
