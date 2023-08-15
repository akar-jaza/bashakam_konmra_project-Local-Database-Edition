import 'package:hive/hive.dart';

part 'department_introduction.g.dart'; // This part is required for Hive code generation.

@HiveType(typeId: 0) // Assign a typeId for the HiveType.
class DepartmentData extends HiveObject {
  @HiveField(0)
  String departmentName;

  @HiveField(1)
  String introduction;

  DepartmentData({
    required this.departmentName,
    required this.introduction,
  });
}
