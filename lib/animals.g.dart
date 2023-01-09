// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animals.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimalsAdapter extends TypeAdapter<Animals> {
  @override
  final int typeId = 3;

  @override
  Animals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Animals(
      numSpecies: fields[1] as int,
      numAnySpecies: fields[2] as double,
      nameSpecies: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Animals obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nameSpecies)
      ..writeByte(1)
      ..write(obj.numSpecies)
      ..writeByte(2)
      ..write(obj.numAnySpecies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
