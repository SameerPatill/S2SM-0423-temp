class Employee {
  int employeeId;
  String firstName;
  String lastName;
  String username;
  bool isAuthenticated;

  Employee(
    this.employeeId,
    this.firstName,
    this.lastName,
    this.username,
    this.isAuthenticated
    );

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        json['employee_id'] != null ? int.parse(json['employee_id']) : -1,
        json['first_name'] ?? "",
        json['last_name'] ?? "",
        json['username'] ?? "",
        int.parse(json['is_authenticated']) == 0 ? false : true,
      );
}
