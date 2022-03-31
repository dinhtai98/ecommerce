import 'package:json_annotation/json_annotation.dart';
part 'device_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DeviceDto {
  String id;
  String macAddress;
  String name;
  String serial;

  DeviceDto({
    required this.macAddress,
    required this.name,
    required this.id,
    required this.serial,
  });

  factory DeviceDto.fromJson(Map<String, dynamic> json) =>
      _$DeviceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceDtoToJson(this);
}
