import 'package:soul_to_soul_admin/responsive.dart';
import 'package:soul_to_soul_admin/screens/dashboard/components/client_count.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/dashboard_header.dart';

import 'components/recent_client_profiles.dart';
import 'components/monthly_report_stats.dart';

class DashboardScreen extends StatelessWidget {
  static const String routename = "/dashboard";
  DashboardScreen(this.setStateCallBack);
  Function? setStateCallBack;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.015,
          top: MediaQuery.of(context).size.height * 0.05,
        ),
        child: Column(
          children: [
            DashboardHeader(
              setStateCallBack: setStateCallBack,
            ),
            // SizedBox(height: defaultPadding),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyFiles(),
                        SizedBox(height: defaultPadding),
                        RecentClientProfiles(),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) MonthlyReportStats(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we don't want to show it
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: MonthlyReportStats(),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
