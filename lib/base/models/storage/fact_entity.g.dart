// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactEntityAdapter extends TypeAdapter<FactEntity> {
  @override
  final int typeId = 0;

  @override
  FactEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FactEntity(
      id: fields[0] as String,
      version: fields[1] as int,
      user: fields[2] as String,
      text: fields[3] as String,
      updatedAt: fields[4] as DateTime,
      createdAt: fields[5] as DateTime,
      deleted: fields[6] as bool,
      type: fields[7] as String,
      statusVerified: fields[8] as bool,
      statusSentCount: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FactEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.version)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.deleted)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.statusVerified)
      ..writeByte(9)
      ..write(obj.statusSentCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
