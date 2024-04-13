// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TSearch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TSearchAdapter extends TypeAdapter<TSearch> {
  @override
  final int typeId = 0;

  @override
  TSearch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TSearch(
      title: fields[0] as String,
    )..id = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, TSearch obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TSearchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
