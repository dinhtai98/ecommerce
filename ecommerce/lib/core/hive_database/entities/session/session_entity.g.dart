// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionEntityAdapter extends TypeAdapter<SessionEntity> {
  @override
  final int typeId = 1;

  @override
  SessionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionEntity(
      id: fields[0] as String?,
      float: fields[9] as double,
      isNoDeclarationType: fields[8] as bool,
      isStart: fields[1] as bool,
      operatorCode: fields[2] as String,
      pushSessionId: fields[6] as bool,
      pushedEndOfDay: fields[7] as bool,
      radioCode: fields[10] as String?,
      batteryCode: fields[11] as String?,
      startSessionOn: fields[4] as DateTime?,
      voidQuantity: fields[12] as int,
      voidValue: fields[13] as double,
      isNeedReview: fields[14] as bool,
      saleLocationId: fields[15] as String?,
      cashierCode: fields[3] as String,
      endSessionOn: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, SessionEntity obj) {
    writer
      ..writeByte(16)
      ..writeByte(1)
      ..write(obj.isStart)
      ..writeByte(2)
      ..write(obj.operatorCode)
      ..writeByte(3)
      ..write(obj.cashierCode)
      ..writeByte(4)
      ..write(obj.startSessionOn)
      ..writeByte(5)
      ..write(obj.endSessionOn)
      ..writeByte(6)
      ..write(obj.pushSessionId)
      ..writeByte(7)
      ..write(obj.pushedEndOfDay)
      ..writeByte(8)
      ..write(obj.isNoDeclarationType)
      ..writeByte(9)
      ..write(obj.float)
      ..writeByte(10)
      ..write(obj.radioCode)
      ..writeByte(11)
      ..write(obj.batteryCode)
      ..writeByte(12)
      ..write(obj.voidQuantity)
      ..writeByte(13)
      ..write(obj.voidValue)
      ..writeByte(14)
      ..write(obj.isNeedReview)
      ..writeByte(15)
      ..write(obj.saleLocationId)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionEntity _$SessionEntityFromJson(Map<String, dynamic> json) =>
    SessionEntity(
      id: json['id'] as String?,
      float: (json['float'] as num?)?.toDouble() ?? 0,
      isNoDeclarationType: json['isNoDeclarationType'] as bool? ?? false,
      isStart: json['isStart'] as bool? ?? false,
      operatorCode: json['operatorCode'] as String,
      pushSessionId: json['pushSessionId'] as bool? ?? false,
      pushedEndOfDay: json['pushedEndOfDay'] as bool? ?? false,
      radioCode: json['radioCode'] as String?,
      batteryCode: json['batteryCode'] as String?,
      startSessionOn: json['startSessionOn'] == null
          ? null
          : DateTime.parse(json['startSessionOn'] as String),
      voidQuantity: json['voidQuantity'] as int? ?? 0,
      voidValue: (json['voidValue'] as num?)?.toDouble() ?? 0,
      isNeedReview: json['isNeedReview'] as bool? ?? false,
      saleLocationId: json['saleLocationId'] as String?,
      cashierCode: json['cashierCode'] as String,
      endSessionOn: json['endSessionOn'] == null
          ? null
          : DateTime.parse(json['endSessionOn'] as String),
    );

Map<String, dynamic> _$SessionEntityToJson(SessionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isStart': instance.isStart,
      'operatorCode': instance.operatorCode,
      'cashierCode': instance.cashierCode,
      'startSessionOn': instance.startSessionOn?.toIso8601String(),
      'endSessionOn': instance.endSessionOn?.toIso8601String(),
      'pushSessionId': instance.pushSessionId,
      'pushedEndOfDay': instance.pushedEndOfDay,
      'isNoDeclarationType': instance.isNoDeclarationType,
      'float': instance.float,
      'radioCode': instance.radioCode,
      'batteryCode': instance.batteryCode,
      'voidQuantity': instance.voidQuantity,
      'voidValue': instance.voidValue,
      'isNeedReview': instance.isNeedReview,
      'saleLocationId': instance.saleLocationId,
    };
