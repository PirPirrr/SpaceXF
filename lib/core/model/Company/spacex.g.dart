// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spacex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spacex _$SpacexFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Spacex',
      json,
      ($checkedConvert) {
        final val = Spacex(
          name: $checkedConvert('name', (v) => v as String?),
          founder: $checkedConvert('founder', (v) => v as String?),
          founded: $checkedConvert('founded', (v) => v as int?),
          employees: $checkedConvert('employees', (v) => v as int?),
          valuation: $checkedConvert('valuation', (v) => v as int?),
          summary: $checkedConvert('summary', (v) => v as String?),
          headquarters: $checkedConvert(
              'headquarters',
              (v) => v == null
                  ? null
                  : Headquarters.fromJson(v as Map<String, dynamic>)),
          links: $checkedConvert(
              'links',
              (v) =>
                  v == null ? null : Links.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SpacexToJson(Spacex instance) => <String, dynamic>{
      'name': instance.name,
      'founder': instance.founder,
      'founded': instance.founded,
      'employees': instance.employees,
      'valuation': instance.valuation,
      'summary': instance.summary,
      'headquarters': instance.headquarters?.toJson(),
      'links': instance.links?.toJson(),
    };
