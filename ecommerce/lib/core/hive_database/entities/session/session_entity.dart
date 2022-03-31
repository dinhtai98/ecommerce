import 'package:ecommerce/core/hive_database/hive_constants.dart';
import 'package:hive/hive.dart';
import '../base_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_entity.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: HiveTypes.sessions)
class SessionEntity extends BaseEntity {
  @HiveField(1)
  bool isStart;
  @HiveField(2)
  String operatorCode;
  @HiveField(3)
  String cashierCode;
  @HiveField(4)
  DateTime? startSessionOn;
  @HiveField(5)
  DateTime? endSessionOn;
  @HiveField(6)
  bool pushSessionId;
  @HiveField(7)
  bool pushedEndOfDay;
  @HiveField(8)
  bool isNoDeclarationType;
  @HiveField(9)
  double float;
  @HiveField(10)
  String? radioCode;
  @HiveField(11)
  String? batteryCode;
  @HiveField(12)
  int voidQuantity;
  @HiveField(13)
  double voidValue;
  @HiveField(14)
  bool isNeedReview;
  @HiveField(15)
  String? saleLocationId;

  SessionEntity({
    String? id,
    this.float = 0,
    this.isNoDeclarationType = false,
    this.isStart = false,
    required this.operatorCode,
    this.pushSessionId = false,
    this.pushedEndOfDay = false,
    this.radioCode,
    this.batteryCode,
    this.startSessionOn,
    this.voidQuantity = 0,
    this.voidValue = 0,
    this.isNeedReview = false,
    this.saleLocationId,
    required this.cashierCode,
    this.endSessionOn,
  }) : super(id: id);
   factory SessionEntity.fromJson(Map<String, dynamic> json) =>
      _$SessionEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SessionEntityToJson(this);
}
