// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DepartmentDataAdapter extends TypeAdapter<DepartmentData> {
  @override
  final int typeId = 0;

  @override
  DepartmentData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DepartmentData(
      gEwaran: fields[0] as double,
      gParallel: fields[1] as double,
      gZankoline: fields[2] as double,
      pEwaran: fields[3] as double,
      pParallel: fields[4] as double,
      pZankoline: fields[5] as double,
      university: fields[6] as String,
      collageInstitute: fields[7] as String,
      department: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DepartmentData obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.gEwaran)
      ..writeByte(1)
      ..write(obj.gParallel)
      ..writeByte(2)
      ..write(obj.gZankoline)
      ..writeByte(3)
      ..write(obj.pEwaran)
      ..writeByte(4)
      ..write(obj.pParallel)
      ..writeByte(5)
      ..write(obj.pZankoline)
      ..writeByte(6)
      ..write(obj.university)
      ..writeByte(7)
      ..write(obj.collageInstitute)
      ..writeByte(8)
      ..write(obj.department);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepartmentDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
