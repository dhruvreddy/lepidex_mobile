// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'butterfly_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ButterflyEntityAdapter extends TypeAdapter<ButterflyEntity> {
  @override
  final int typeId = 3;

  @override
  ButterflyEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ButterflyEntity(
      path: fields[0] as String?,
      commonName: fields[1] as String,
      binomialName: fields[2] as String,
      domain: fields[3] as String,
      kingdom: fields[4] as String,
      phylum: fields[5] as String,
      className: fields[6] as String,
      order: fields[7] as String,
      family: fields[8] as String,
      genus: fields[9] as String,
      species: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ButterflyEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.path)
      ..writeByte(1)
      ..write(obj.commonName)
      ..writeByte(2)
      ..write(obj.binomialName)
      ..writeByte(3)
      ..write(obj.domain)
      ..writeByte(4)
      ..write(obj.kingdom)
      ..writeByte(5)
      ..write(obj.phylum)
      ..writeByte(6)
      ..write(obj.className)
      ..writeByte(7)
      ..write(obj.order)
      ..writeByte(8)
      ..write(obj.family)
      ..writeByte(9)
      ..write(obj.genus)
      ..writeByte(10)
      ..write(obj.species);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ButterflyEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
