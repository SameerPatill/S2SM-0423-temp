import 'package:flutter/material.dart';
import 'package:soul_to_soul_matrimony/models/s2sm_employee.dart';

class EmployeeController extends ChangeNotifier {
  Employee? _currentEmployee;

  Employee? get currentEmployee => _currentEmployee;
  set currentEmployee(emp) => _currentEmployee = emp;

  void setCurrentEmployee(Employee emp) {
    _currentEmployee = emp;
    notifyListeners();
  }
}
