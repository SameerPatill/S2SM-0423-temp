import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'stats_chart.dart';
import 'monthly_profiles_info_card.dart';

class MonthlyReportDetails extends StatelessWidget {
  const MonthlyReportDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monthly Report",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          MonthlyProfileInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "January",
            amountOfFiles: "1.3GB",
            numOfFiles: 1328,
          ),
          MonthlyProfileInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "February",
            amountOfFiles: "15.3GB",
            numOfFiles: 1328,
          ),
          MonthlyProfileInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "March",
            amountOfFiles: "1.3GB",
            numOfFiles: 1328,
          ),
          MonthlyProfileInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "April",
            amountOfFiles: "1.3GB",
            numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}
