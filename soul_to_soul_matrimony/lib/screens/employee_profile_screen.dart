import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:provider/provider.dart';
import 'package:soul_to_soul_matrimony/constants.dart';
import 'package:soul_to_soul_matrimony/controllers/MenuAppController.dart';
import 'package:soul_to_soul_matrimony/controllers/database_controller.dart';
import 'package:soul_to_soul_matrimony/models/database_functions.dart';
import 'package:soul_to_soul_matrimony/models/s2sm_employee.dart';
import 'package:soul_to_soul_matrimony/screens/dashboard/components/dashboard_header.dart';

class EmployeeProfileScreen extends StatefulWidget {
  EmployeeProfileScreen(this.setStateCallBack);
  Function? setStateCallBack;
  @override
  State<EmployeeProfileScreen> createState() => _EmployeeProfileScreenState();
}

class _EmployeeProfileScreenState extends State<EmployeeProfileScreen> {
  List<Employee> _employees = [];
  List<Employee> _searchEmployees = [];

  @override
  void initState() {
    super.initState();
  }

  // Future<void> _executeUpdateCheckQuery() async {
    // var conn = await DatabaseController.connectoToDatabase();
    // // final result = await DatabaseController.executeQueryOnDatabase(
    // //   conn,
    // //   "SELECT e.employee_id, e.first_name, e.last_name, e.username, eu.is_online, eu.is_blocked, eu.last_active FROM employee e INNER JOIN employee_utilities eu ON e.employee_id = eu.employee_id; ",
    // // );
    // DatabaseController.closeConnectionToDatabase(conn);

    // // for (var element in result.rows) {
    // //   Employee emp = Employee.fromJson(element.assoc());
    // //   for (var el in _employees) {
    // //     if (emp.employeeId == el.employeeId) {
    // //       if (emp.isOnline != el.isOnline || emp.isBlocked != el.isBlocked) {
    // //         setState(() {
    // //           int ind = _employees.indexOf(el);
    // //           _employees[ind] = emp;
    // //         });
    // //       }
    // //       break;
    // //     }
    // //   }
    // // }

    // Future.delayed(const Duration(seconds: 5), _executeUpdateCheckQuery);
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot)
      {
        return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.015,
          top: MediaQuery.of(context).size.height * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Profile",
                      style: GoogleFonts.nunito(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.25),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          DateFormat("MMM d,\nyyyy").format(DateTime.now()),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.005),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.045,
                          child: VerticalDivider(
                            color: Colors.grey.shade400,
                            thickness: 3,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          DateFormat("EEEE").format(DateTime.now()),
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding * 1.5,
                                    vertical: defaultPadding / 0.8,
                                  ),
                                ),
                                onPressed: () {
                                  Provider.of<MenuAppController>(context,
                                          listen: false)
                                      .selectedNav = 0;
                                  widget.setStateCallBack!(0);
                                },
                                // icon: SvgPicture.asset(
                                //     "assets/icons/menu_dashboard.svg"),
                                child: Text(
                                  "Dashboard",
                                  style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.width * 0.1,
                        // child: CircleAvatar(
                        //   radius: 60,
                        //   backgroundColor: Color.fromARGB(255, 189, 189, 189),
                        //   child: Icon(
                        //     Icons.person,
                        //     size: 75,
                        //     color: Colors.black,
                        //   ),
                        // )
                        child: Image.asset('assets/images/user.png'),
                      ),
                    ],
                  ),

                   SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("John Doe", style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        
                      ),textAlign: TextAlign.center, ),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Icon(
                        Icons.edit_outlined,
                      )
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                

                Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                child: Column(

                  children: [

                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Basic Details", style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        
                      ), 
                      ),
                    ], 
                  ),

                  ],
                
                ),
                ),

                //basic details starts here

                Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, top: MediaQuery.of(context).size.width * 0.02),
                child: Row(

                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5),
                      child: 
                      Text("EMPLOYEE ID", style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        
                      ), 
                      ),
                      ),
                      

                      SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                      ),

                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "12345",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],)
                    ], 
                  ),

                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5),
                      child:
                        Text("FIRST NAME", style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        
                      ), 
                      ),
                    
                      ),
                      
                      SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                      ),

                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Employee-First",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],)
                    ], 
                  ),


                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5),
                      child:
                        Text("LAST NAME", style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        
                      ), 
                      ),
                    
                      ),
                      
                      SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                      ),

                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Employee-Last",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],)
                    ], 
                  ),

                  ],
                
                ),
                ),


                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),


                Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, top: MediaQuery.of(context).size.width * 0.02),
                child: Row(

                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5),
                      child: 
                      Text("D.O.B.", style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        
                      ), 
                      ),
                      ),
                      

                      SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                      ),

                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "DD/MM/YYYY",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],)
                    ], 
                  ),

                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5),
                      child:
                        Text("EDUCATION", style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        
                      ), 
                      ),
                    
                      ),
                      
                      SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                      ),

                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Employee-Education",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],)
                    ], 
                  ),


                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5),
                      child:
                        Text("EMAIL-ID", style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        
                      ), 
                      ),
                    
                      ),
                      
                      SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                      ),

                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Employee-Email",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],)
                    ], 
                  ),

                  ],
                
                ),
                ),
                


                Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, top: MediaQuery.of(context).size.width * 0.04),
                child: Column(

                  children: [

                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Other Details", style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        
                      ), 
                      ),
                    ], 
                  ),

                  ],
                
                ),
                ),
                
                  
                //other details starts here

                Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, top: MediaQuery.of(context).size.width * 0.02),
                child: Row(

                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5),
                      child: 
                      Text("TOTAL PROFILES CREATED", style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        
                      ), 
                      ),
                      ),
                      

                      SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                      ),

                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "10",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],)
                    ], 
                  ),

                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5),
                      child:
                        Text("SAMPLE FIELD", style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        
                      ), 
                      ),
                    
                      ),
                      
                      SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                      ),

                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Sample Data",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],)
                    ], 
                  ),


                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5),
                      child:
                        Text("SAMPLE FIELD", style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        
                      ), 
                      ),
                    
                      ),
                      
                      SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                      ),

                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Sample Data",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],)
                    ], 
                  ),

                  ],
                
                ),
                ),


                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.02,
                // ),


                // Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, top: MediaQuery.of(context).size.width * 0.02),
                // child: Row(

                //   children: [

                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(padding: EdgeInsets.only(left: 5),
                //       child: 
                //       Text("D.O.B.", style: GoogleFonts.nunito(
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 15,
                        
                //       ), 
                //       ),
                //       ),
                      

                //       SizedBox(
                //       height: MediaQuery.of(context).size.height * 0.01,
                //       ),

                //     Row(children: [
                //       Container(
                //         width: MediaQuery.of(context).size.width * 0.17,
                //         padding: EdgeInsets.all(11),
                //         decoration: BoxDecoration(
                //           color: Color.fromARGB(255, 239, 239, 239),
                //           borderRadius: BorderRadius.circular(5),
                //         ),
                //         child: Text(
                //           "DD/MM/YYYY",
                //           style: GoogleFonts.nunito(
                //             color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 15,
                //           ),
                //           textAlign: TextAlign.left,
                //         ),
                //       ),
                //     ],)
                //     ], 
                //   ),

                //   SizedBox(
                //       width: MediaQuery.of(context).size.width * 0.1,
                //       ),

                //   Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(padding: EdgeInsets.only(left: 5),
                //       child:
                //         Text("EDUCATION", style: GoogleFonts.nunito(
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 15,
                        
                //       ), 
                //       ),
                    
                //       ),
                      
                //       SizedBox(
                //       height: MediaQuery.of(context).size.height * 0.01,
                //       ),

                //     Row(children: [
                //       Container(
                //         width: MediaQuery.of(context).size.width * 0.17,
                //         padding: EdgeInsets.all(11),
                //         decoration: BoxDecoration(
                //           color: Color.fromARGB(255, 239, 239, 239),
                //           borderRadius: BorderRadius.circular(5),
                //         ),
                //         child: Text(
                //           "Employee-Education",
                //           style: GoogleFonts.nunito(
                //             color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 15,
                //           ),
                //           textAlign: TextAlign.left,
                //         ),
                //       ),
                //     ],)
                //     ], 
                //   ),


                //   SizedBox(
                //       width: MediaQuery.of(context).size.width * 0.1,
                //       ),

                //   Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(padding: EdgeInsets.only(left: 5),
                //       child:
                //         Text("EMAIL-ID", style: GoogleFonts.nunito(
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 15,
                        
                //       ), 
                //       ),
                    
                //       ),
                      
                //       SizedBox(
                //       height: MediaQuery.of(context).size.height * 0.01,
                //       ),

                //     Row(children: [
                //       Container(
                //         width: MediaQuery.of(context).size.width * 0.17,
                //         padding: EdgeInsets.all(11),
                //         decoration: BoxDecoration(
                //           color: Color.fromARGB(255, 239, 239, 239),
                //           borderRadius: BorderRadius.circular(5),
                //         ),
                //         child: Text(
                //           "Employee-Email",
                //           style: GoogleFonts.nunito(
                //             color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 15,
                //           ),
                //           textAlign: TextAlign.left,
                //         ),
                //       ),
                //     ],)
                //     ], 
                //   ),

                //   ],
                
                // ),
                // ),



                //    SizedBox(
                //     height: MediaQuery.of(context).size.height * 0.05,
                //   ),

                //   Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                //   child: 
                //     Row(
                //     children: [
                //       Text("Basic Details", style: GoogleFonts.nunito(
                //         color: Colors.grey,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 24,
                //       ),),
                //       ],
                //     ),
                //   ),
                  
                //   SizedBox(
                //     height: MediaQuery.of(context).size.height * 0.025,
                //   ),

                // Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                //   child: 
                //     Column(
                //     children: [
                //         Container(
                //         width: MediaQuery.of(context).size.width * 0.75,
                //         height: MediaQuery.of(context).size.height * 0.7,
                //         child:
                //           Text("FIRST NAME",
                //           style: GoogleFonts.nunito(
                //             color: Colors.black,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 15,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                  
                  

                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child:
                    
                    ListView.builder(
                      itemCount: _employees.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: ListTile(
                              tileColor: Colors.white,
                              // _employees[index].isBlocked
                              //     ? Colors.red.shade100
                              //     : Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                                // vertical: MediaQuery.of(context).size.height * 0.01,
                              ),
                              trailing: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.155,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        
                                            // _employees[index].isBlocked
                                            //     ? Colors.red
                                            //     : Colors.transparent,
                                        foregroundColor: Colors.grey,
                                            // _employees[index].isBlocked
                                            //     ? Colors.white
                                            //     : Colors.grey,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            side: BorderSide(
                                              color: Colors.grey,
                                              // _employees[index].isBlocked
                                              //     ? Colors.transparent
                                              //     : Colors.grey,
                                            )),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.018,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                      ),
                                      onPressed: () async {
                                      
                                      },
                                      child: Text("View",
                                        // _employees[index].isBlocked
                                        //     ? "Unblock"
                                        //     : "Block",
                                        style: GoogleFonts.nunito(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.015,
                                    ),
                                    ElevatedButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        // Color.fromARGB(156, 10, 103, 216),
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          // side: BorderSide(color: Colors.grey),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.013,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Edit",
                                        style: GoogleFonts.nunito(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Colors.black,
                                  // _employees[index].isBlocked
                                  //     ? Colors.red.shade100
                                  //     : Colors.black,
                                  width: 0,
                                ),
                              ),
                              title: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                // color: Colors.black,
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.male_outlined,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "Profile-1",
                                      // "${_employees[index].firstName} ${_employees[index].lastName}",
                                      style: GoogleFonts.nunito(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: MediaQuery.of(context).size.width *
                                    //       0.02,
                                    // ),
                                    // Text(
                                    //   "Online",
                                    //   // _employees[index].isOnline
                                    //   //     ? "Online"
                                    //   //     : "Offline",
                                    //   style: GoogleFonts.nunito(
                                    //     color: Colors.white,
                                    //     // _employees[index].isOnline
                                    //     //     ? Colors.green
                                    //     //     : Colors.red,
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 16,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ]
        ),
      );
      } 
      
    );
  }
}
