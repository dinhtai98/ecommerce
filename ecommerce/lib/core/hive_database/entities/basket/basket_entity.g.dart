// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasketItemEntityAdapter extends TypeAdapter<BasketItemEntity> {
  @override
  final int typeId = 2;

  @override
  BasketItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BasketItemEntity(
      id: fields[0] as String?,
      productId: fields[1] as String,
      productName: fields[2] as String,
      unitPrice: fields[3] as double,
      qty: fields[4] as int,
      image: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BasketItemEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.unitPrice)
      ..writeByte(4)
      ..write(obj.qty)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
