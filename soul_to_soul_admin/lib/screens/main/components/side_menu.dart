import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soul_to_soul_admin/controllers/AdminController.dart';
import 'package:soul_to_soul_admin/controllers/MenuAppController.dart';
import 'package:soul_to_soul_admin/models/database_functions.dart';
import 'package:soul_to_soul_admin/screens/login_screen.dart';

class SideMenu extends StatelessWidget {
  SideMenu({
    Key? key,
    required this.setStateCallBack,
  }) : super(key: key);

  Function setStateCallBack;

  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        Provider.of<MenuAppController>(context, listen: false).selectedNav;
    return Drawer(
      elevation: 0,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02),
            child: DrawerHeader(
              child: Image.asset("assets/images/logo.jpg"),
            ),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            is_selected: selectedIndex == 0 ? true : false,
            press: () {
              Provider.of<MenuAppController>(context, listen: false)
                  .selectedNav = 0;
              setStateCallBack(0);
            },
          ),
          // DrawerListTile(
          //   title: "Employees",
          //   svgSrc: "assets/icons/menu_tran.svg",
          //   is_selected: selectedIndex == 1 ? true : false,
          //   press: () {
          //     // Navigator.of(context)
          //     //     .pushReplacementNamed(CreateMaritalProfileScreen.routename);
          //     Provider.of<MenuAppController>(context, listen: false)
          //         .selectedNav = 1;
          //     setStateCallBack(1);
          //   },
          // ),
          DrawerListTile(
            title: "Search Marital Profile",
            svgSrc: "assets/icons/menu_task.svg",
            is_selected: selectedIndex == 1 ? true : false,
            press: () {
              Provider.of<MenuAppController>(context, listen: false)
                  .selectedNav = 1;
              setStateCallBack(
                1,
              );
            },
          ),
          DrawerListTile(
            title: "Employees",
            svgSrc: "assets/icons/menu_profile.svg",
            is_selected: selectedIndex == 2 ? true : false,
            press: () {
              Provider.of<MenuAppController>(context, listen: false)
                  .selectedNav = 2;
              setStateCallBack(
                2,
              );
            },
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            is_selected: selectedIndex == 3 ? true : false,
            press: () {},
          ),
          customDrawerListTile(
            title: "Logout",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              Provider.of<AdminController>(context, listen: false)
                  .setCurrentEAdmin(null);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
            },
          ),
          copyrightInfo(
            title: "Designed and Developed By\nTantra Technologies\n©${DateTime.now().year}",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.is_selected,
  }) : super(key: key);

  final String title, svgSrc;
  bool is_selected;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.01,
        left: MediaQuery.of(context).size.width * 0.01,
        // horizontal: MediaQuery.of(context).size.height * 0.01,
      ),
      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        selected: is_selected,
        selectedTileColor: Colors.red.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        leading: SvgPicture.asset(
          svgSrc,
          colorFilter: const ColorFilter.mode(
              Color.fromARGB(137, 0, 0, 0), BlendMode.srcIn),
          height: 16,
        ),
        title: Text(
          title,
          style: GoogleFonts.nunito(
            color: const Color.fromARGB(137, 0, 0, 0),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

//for specific values of custom components

class customDrawerListTile extends StatelessWidget {
  const customDrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.01,
        left: MediaQuery.of(context).size.width * 0.01,
      ),
      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          colorFilter: const ColorFilter.mode(
              Color.fromRGBO(212, 71, 71, 0.831), BlendMode.srcIn),
          height: 16,
        ),
        title: Text(
          title,
          style: GoogleFonts.nunito(
            color: const Color.fromRGBO(212, 71, 71, 0.831),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class copyrightInfo extends StatelessWidget {
  const copyrightInfo({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: press,
      // contentPadding: EdgeInsets.only(top: 360, left: 25, right: 25),
      contentPadding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.26,
      ),
      horizontalTitleGap: 0.0,
      title: Text(title,
          textAlign: TextAlign.center,
          style:
              // TextStyle(color: Color.fromARGB(210, 137, 133, 133), fontSize: 14),
              GoogleFonts.nunito(
            color: const Color.fromARGB(210, 161, 158, 158),
            fontSize: 14,
          )),
    );
  }
}
