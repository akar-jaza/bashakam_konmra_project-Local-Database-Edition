// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_introduction.dart';

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
      departmentName: fields[0] as String,
      introduction: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DepartmentData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.departmentName)
      ..writeByte(1)
      ..write(obj.introduction);
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
