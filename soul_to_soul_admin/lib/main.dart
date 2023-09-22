import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:provider/provider.dart';
import 'package:soul_to_soul_admin/constants.dart';
import 'package:soul_to_soul_admin/controllers/AdminController.dart';
import 'package:soul_to_soul_admin/controllers/LoginScreenController.dart';
import 'package:soul_to_soul_admin/controllers/MenuAppController.dart';
import 'package:soul_to_soul_admin/models/database_functions.dart';
import 'package:soul_to_soul_admin/models/s2sm_admin.dart';
import 'package:soul_to_soul_admin/screens/dashboard/dashboard_screen.dart';
import 'package:soul_to_soul_admin/screens/login_screen.dart';

import 'package:soul_to_soul_admin/utilities/static_data.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    // alwaysOnTop: true,
    center: true,
    fullScreen: true,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // exitCallback();
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool ctrlCommandPressed = false;
  bool f4QPressed = false;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuAppController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
      ],
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (value) {
          if (value.isMetaPressed) {
            ctrlCommandPressed = value is RawKeyDownEvent;
          } else if (value.isKeyPressed(LogicalKeyboardKey.keyQ)) {
            f4QPressed = value is RawKeyDownEvent;
          }

          if (ctrlCommandPressed && f4QPressed) {
            // exitCallback();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Soul To Soul Matrimony',
          theme: ThemeData(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.black),
            canvasColor: secondaryColor,
            primarySwatch: Colors.red,
            inputDecorationTheme: FilledOrOutlinedTextTheme(
              radius: 8,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              errorStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              fillColor: Colors.transparent,
              prefixIconColor: Colors.grey,
              enabledColor: Colors.grey,
              focusedColor: Colors.grey,
              floatingLabelStyle: const TextStyle(color: Colors.red),
              width: 1.5,
              labelStyle: GoogleFonts.nunito(fontSize: 16, color: Colors.black),
            ),
          ),
          home: const LoginScreen(),
          routes: {
            // CreateMaritalProfileScreen.routename: (context) =>
            //     CreateMaritalProfileScreen(null),
            DashboardScreen.routename: (context) => DashboardScreen(null),
          },
        ),
      ),
    );
  }
}

// void exitCallback() async {
//   await DatabaseFunctions.markEmployeeOffline(StaticData.emp!.employeeId);
// }
