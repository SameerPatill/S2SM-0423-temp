import 'package:soul_to_soul_matrimony/models/s2sm_employee.dart';
import 'package:soul_to_soul_matrimony/controllers/database_controller.dart';

class DatabaseFunctions {
  static Future<int> authenticateEmployee(String empId, String password) async {
    var conn = await DatabaseController.connectoToDatabase();
    var result = await DatabaseController.executeQueryOnDatabase(
      conn,
      // 'SELECT employee_id, password FROM employee WHERE username="$empId"'
      'SELECT e.employee_id, e.password, eu.is_blocked FROM employee e INNER JOIN employee_utilities eu ON e.employee_id = eu.employee_id WHERE e.username = "$empId"; ',
    );

    if (result.numOfRows == 1) {
      if (result.rows.first.assoc()['password'] == password &&
          int.parse(result.rows.first.assoc()['is_blocked']!) == 0) {
        await markEmployeeOnline(result.rows.first.assoc()["employee_id"]!);
        DatabaseController.closeConnectionToDatabase(conn);
        return 1; // Authenticated
      } else if (int.parse(result.rows.first.assoc()['is_blocked']!) == 1) {
        DatabaseController.closeConnectionToDatabase(conn);
        return 0; // Blocked
      } else {
        DatabaseController.closeConnectionToDatabase(conn);
        return -1; // Incorrect Credentials
      }
    } else {
      DatabaseController.closeConnectionToDatabase(conn);
      return -2; // Technical issue
    }
  }

  static Future<void> markEmployeeOnline(String empid) async {
    var conn = await DatabaseController.connectoToDatabase();
    await DatabaseController.executeQueryOnDatabase(conn,
        'UPDATE employee_utilities SET is_online=1 WHERE employee_id=$empid');
    DatabaseController.closeConnectionToDatabase(conn);
  }

  static Future<void> markEmployeeOffline(int empid) async {
    var conn = await DatabaseController.connectoToDatabase();
    await DatabaseController.executeQueryOnDatabase(conn,
        'UPDATE employee_utilities SET is_online=0 WHERE employee_id=$empid');
    DatabaseController.closeConnectionToDatabase(conn);
  }

  static Future<Employee> getEmployeeDetails(String empId) async {
    var conn = await DatabaseController.connectoToDatabase();
    var result = await DatabaseController.executeQueryOnDatabase(
        conn, 'SELECT * FROM employee WHERE username="$empId"');
    // print(result.rows.first.assoc());
    // if (result.numOfRows == 1) {
    DatabaseController.closeConnectionToDatabase(conn);
    Map<String, String?> employeeDetails = result.rows.first.assoc();
    return Employee(
        int.parse(employeeDetails['employee_id']!),
        employeeDetails['first_name']!,
        employeeDetails['last_name']!,
        employeeDetails['username']!,
        true);
    // }
  }
}
