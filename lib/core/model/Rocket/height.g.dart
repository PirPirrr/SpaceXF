// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'height.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Height _$HeightFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Height',
      json,
      ($checkedConvert) {
        final val = Height(
          meters: $checkedConvert('meters', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$HeightToJson(Height instance) => <String, dynamic>{
      'meters': instance.meters,
    };
