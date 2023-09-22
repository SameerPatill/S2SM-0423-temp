import 'package:flutter/material.dart';
import 'package:soul_to_soul_admin/models/s2sm_admin.dart';

class AdminController extends ChangeNotifier {
  Admin? _currentAdmin;

  Admin? get currentAdmin => _currentAdmin;

  void setCurrentEAdmin(Admin? admin) {
    _currentAdmin = admin;
    notifyListeners();
  }
}
