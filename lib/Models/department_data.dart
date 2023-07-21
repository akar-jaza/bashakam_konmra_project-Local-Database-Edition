import 'package:hive/hive.dart';

part 'department_data.g.dart'; // This part is required for Hive code generation.

@HiveType(typeId: 0) // Assign a typeId for the HiveType.
class DepartmentData extends HiveObject {
  @HiveField(0)
  double gEwaran;

  @HiveField(1)
  double gParallel;

  @HiveField(2)
  double gZankoline;

  @HiveField(3)
  double pEwaran;

  @HiveField(4)
  double pParallel;

  @HiveField(5)
  double pZankoline;

  @HiveField(6)
  String university;

  @HiveField(7)
  String collageInstitute;

  @HiveField(8)
  String department;

  DepartmentData({
    required this.gEwaran,
    required this.gParallel,
    required this.gZankoline,
    required this.pEwaran,
    required this.pParallel,
    required this.pZankoline,
    required this.university,
    required this.collageInstitute,
    required this.department,
  });
}
