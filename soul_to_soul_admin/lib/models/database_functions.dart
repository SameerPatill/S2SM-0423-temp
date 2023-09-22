import 'package:soul_to_soul_admin/models/s2sm_admin.dart';
import 'package:soul_to_soul_admin/controllers/database_controller.dart';
import 'package:soul_to_soul_admin/models/s2sm_employee.dart';

class DatabaseFunctions {
  static Future<bool> authenticateAdmin(String adminId, String password) async {
    var conn = await DatabaseController.connectoToDatabase();
    var result = await DatabaseController.executeQueryOnDatabase(
        conn, 'SELECT admin_id, password FROM admin WHERE username="$adminId"');
    // print(result.rows.first.assoc());
    if (result.numOfRows == 1) {
      if (result.rows.first.assoc()['password'] == password) {
        DatabaseController.closeConnectionToDatabase(conn);
        return true;
      } else {
        DatabaseController.closeConnectionToDatabase(conn);
        return false;
      }
    } else {
      DatabaseController.closeConnectionToDatabase(conn);
      return false;
    }
  }

  static Future<Admin> getAdminDetails(String adminId) async {
    var conn = await DatabaseController.connectoToDatabase();
    var result = await DatabaseController.executeQueryOnDatabase(
        conn, 'SELECT * FROM admin WHERE username="$adminId"');
    // print(result.rows.first.assoc());
    // if (result.numOfRows == 1) {
    DatabaseController.closeConnectionToDatabase(conn);
    Map<String, String?> adminDetails = result.rows.first.assoc();
    return Admin(
        int.parse(adminDetails['admin_id']!),
        adminDetails['first_name']!,
        adminDetails['last_name']!,
        adminDetails['username']!,
        true);
    // }
  }

  static Future<List<Employee>> getAllEmployees() async {
    var conn = await DatabaseController.connectoToDatabase();
    var result = await DatabaseController.executeQueryOnDatabase(
      conn,
      "SELECT e.employee_id, e.first_name, e.last_name, e.username, eu.is_online, eu.is_blocked, eu.last_active FROM employee e INNER JOIN employee_utilities eu ON e.employee_id = eu.employee_id; ",
    );
    DatabaseController.closeConnectionToDatabase(conn);

    List<Employee> employees = [];

    for (var element in result.rows) {
      final emp = element.assoc();
      employees.add(
        Employee(
          emp['employee_id'] == null ? -1 : int.parse(emp['employee_id']!),
          emp['first_name'] ?? "",
          emp['last_name'] ?? "",
          emp['username'] ?? "",
          int.parse(emp['is_online']!) == 0 ? false : true,
          int.parse(emp['is_blocked']!) == 0 ? false : true,
        ),
      );
    }
    return employees;
  }

  static Future<void> unblockEmployee(int empId) async {
    var conn = await DatabaseController.connectoToDatabase();
    var result = await DatabaseController.executeQueryOnDatabase(
      conn,
      "UPDATE employee_utilities SET is_blocked = 0 WHERE employee_id = $empId",
    );
    DatabaseController.closeConnectionToDatabase(conn);
  }

  static Future<void> blockEmployee(int empId) async {
    var conn = await DatabaseController.connectoToDatabase();
    var result = await DatabaseController.executeQueryOnDatabase(
      conn,
      "UPDATE employee_utilities SET is_blocked = 1 WHERE employee_id = $empId",
    );
    DatabaseController.closeConnectionToDatabase(conn);
  }
}
