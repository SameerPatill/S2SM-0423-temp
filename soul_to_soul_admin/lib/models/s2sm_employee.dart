import 'package:intl/intl.dart';

class Employee {
  int employeeId;
  String firstName;
  String lastName;
  String username;
  bool isOnline;
  bool isBlocked;

  Employee(
    this.employeeId,
    this.firstName,
    this.lastName,
    this.username,
    this.isOnline,
    this.isBlocked,
  );

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        json['employee_id'] != null ? int.parse(json['employee_id']) : -1,
        json['first_name'] ?? "",
        json['last_name'] ?? "",
        json['username'] ?? "",
        int.parse(json['is_online']) == 0 ? false : true,
        int.parse(json['is_blocked']) == 0 ? false : true,
      );
}
