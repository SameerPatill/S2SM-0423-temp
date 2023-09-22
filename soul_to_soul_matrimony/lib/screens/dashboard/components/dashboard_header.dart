import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:soul_to_soul_matrimony/controllers/EmployeeController.dart';
import 'package:soul_to_soul_matrimony/controllers/MenuAppController.dart';
import 'package:soul_to_soul_matrimony/models/s2sm_employee.dart';
import 'package:soul_to_soul_matrimony/responsive.dart';
import 'package:soul_to_soul_matrimony/screens/dashboard/components/client_count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class DashboardHeader extends StatelessWidget {
  DashboardHeader({
    Key? key,
    this.setStateCallBack,
  }) : super(key: key);

  Function? setStateCallBack;

  @override
  Widget build(BuildContext context) {
    Employee emp = Provider.of<EmployeeController>(context).currentEmployee!;
    return Row(
      children: [
        DateTime.now().hour >= 0 && DateTime.now().hour < 12
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning,",
                    style: GoogleFonts.nunito(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    "${emp.firstName} ${emp.lastName}",
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // color: Colors.grey.shade600,
                    ),
                  ),
                ],
              )
            : DateTime.now().hour > 12 && DateTime.now().hour < 16
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Afternoon,",
                        style: GoogleFonts.nunito(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        "${emp.firstName} ${emp.lastName}",
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  )
                : DateTime.now().hour > 16 && DateTime.now().hour < 18
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Evening,",
                            style: GoogleFonts.nunito(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            "${emp.firstName} ${emp.lastName}",
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              // color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Night,",
                            style: GoogleFonts.nunito(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            "${emp.firstName} ${emp.lastName}",
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              // color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.25),
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
                    horizontal: MediaQuery.of(context).size.width * 0.005),
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
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding * 1.5,
                            vertical: defaultPadding / 0.8,
                          ),
                        ),
                        onPressed: () {
                          Provider.of<MenuAppController>(context, listen: false)
                              .selectedNav = 1;
                          setStateCallBack!(1);
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 26,
                        ),
                        label: Text(
                          "Create Profile",
                          style: GoogleFonts.nunito(
                              fontSize: 20, fontWeight: FontWeight.w600),
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
    );
  }
}
