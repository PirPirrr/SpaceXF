// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mass _$MassFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Mass',
      json,
      ($checkedConvert) {
        final val = Mass(
          kg: $checkedConvert('kg', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$MassToJson(Mass instance) => <String, dynamic>{
      'kg': instance.kg,
    };
