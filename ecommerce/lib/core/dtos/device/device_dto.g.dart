// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDto _$DeviceDtoFromJson(Map<String, dynamic> json) => DeviceDto(
      macAddress: json['macAddress'] as String,
      name: json['name'] as String,
      id: json['id'] as String,
      serial: json['serial'] as String,
    );

Map<String, dynamic> _$DeviceDtoToJson(DeviceDto instance) => <String, dynamic>{
      'id': instance.id,
      'macAddress': instance.macAddress,
      'name': instance.name,
      'serial': instance.serial,
    };
