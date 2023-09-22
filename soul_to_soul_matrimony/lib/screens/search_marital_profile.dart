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

class SearchProfileScreen extends StatefulWidget {
  SearchProfileScreen(this.setStateCallBack);
  Function? setStateCallBack;
  @override
  State<SearchProfileScreen> createState() => _SearchProfileScreenState();
}

class _SearchProfileScreenState extends State<SearchProfileScreen> {
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
          left: MediaQuery.of(context).size.width * 0.03,
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
                      "Search Marital\nProfile",
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
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.52,
                        child: MaterialTextField(
                          keyboardType: TextInputType.text,
                          style: GoogleFonts.nunito(),
                          hint: 'Enter Profile ID',
                          labelText: 'Search Profile',
                          textInputAction: TextInputAction.done,
                          prefixIcon: const Icon(Icons.search_rounded),
                          controller: null,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.12,
                                    child: ElevatedButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: defaultPadding * 1.6,
                                          vertical: defaultPadding / 0.9,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Search Profile",
                                        style: GoogleFonts.nunito(
                                            fontSize: 18,
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
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),

                  Row(
                    children: [
                      Text("Recently Accessed Profiles", style: GoogleFonts.nunito(
                        color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                      ),)
                    ],
                  ),

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
