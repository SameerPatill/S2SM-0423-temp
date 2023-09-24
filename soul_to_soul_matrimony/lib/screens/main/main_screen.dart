import 'package:soul_to_soul_matrimony/controllers/MenuAppController.dart';
import 'package:soul_to_soul_matrimony/responsive.dart';
import 'package:soul_to_soul_matrimony/screens/create_marital_profile_screen.dart';
import 'package:soul_to_soul_matrimony/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soul_to_soul_matrimony/screens/employee_profile_screen.dart';
import 'package:soul_to_soul_matrimony/screens/search_marital_profile.dart';

import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void setStateCallBack(int ind) {
    setState(() {
      selectedIndex = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      DashboardScreen(setStateCallBack),
      CreateMaritalProfileScreen(setStateCallBack),
      SearchProfileScreen(setStateCallBack),
      EmployeeProfileScreen(setStateCallBack),
    ];
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(
        setStateCallBack: setStateCallBack,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.19,
              child: SideMenu(
                setStateCallBack: setStateCallBack,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.81,
              child: screens[selectedIndex],
              // Navigator(
              //   onGenerateRoute: (settings) {
              //     // Handle the initial route, e.g., display the default screen
              //     print(settings.name);
              //     if (settings.name == null) {
              //       return MaterialPageRoute(
              //         builder: (context) => DashboardScreen(),
              //       );
              //     }
              //     // Handle other routes
              //     return MaterialPageRoute(
              //       builder: (context) => _buildRoute(settings.name!),
              //     );
              // },
              // ),
            ),
            //   const Expanded(
            //     // default flex = 1
            //     // and it takes 1/6 part of the screen
            //     child: SideMenu(),
            //   ),

            // Expanded(
            //   // It takes 5/6 part of the screen
            //   flex: 5,
            //   child: DashboardScreen(),
            // ),
          ],
        ),
      ),
    );
  }
}

// Widget _buildRoute(String routeName) {
//   print(routeName);
//   switch (routeName) {
//     case CreateMaritalProfileScreen.routename:
//       return const CreateMaritalProfileScreen();
//     case DashboardScreen.routename:
//       return DashboardScreen();
//     default:
//       return DashboardScreen(); // Handle unknown routes, if necessary
//   }
// }
