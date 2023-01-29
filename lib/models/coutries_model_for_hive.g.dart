// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coutries_model_for_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountriesModelForHiveAdapter extends TypeAdapter<CountriesModelForHive> {
  @override
  final int typeId = 1;

  @override
  CountriesModelForHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountriesModelForHive(
      code: fields[0] as String?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
      continent: fields[3] as Continent?,
      capital: fields[4] as String?,
      currency: fields[5] as String?,
      emoji: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CountriesModelForHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.continent)
      ..writeByte(4)
      ..write(obj.capital)
      ..writeByte(5)
      ..write(obj.currency)
      ..writeByte(6)
      ..write(obj.emoji);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountriesModelForHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ContinentAdapter extends TypeAdapter<Continent> {
  @override
  final int typeId = 2;

  @override
  Continent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Continent(
      code: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Continent obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContinentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
