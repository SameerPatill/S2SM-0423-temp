import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_text_fields/theme/material_text_field_theme.dart';
import 'package:provider/provider.dart';
import 'package:soul_to_soul_matrimony/constants.dart';
import 'package:soul_to_soul_matrimony/controllers/EmployeeController.dart';
import 'package:soul_to_soul_matrimony/controllers/LoginScreenController.dart';
import 'package:soul_to_soul_matrimony/controllers/MenuAppController.dart';
import 'package:soul_to_soul_matrimony/models/database_functions.dart';
import 'package:soul_to_soul_matrimony/screens/create_marital_profile_screen.dart';
import 'package:soul_to_soul_matrimony/screens/dashboard/dashboard_screen.dart';
import 'package:soul_to_soul_matrimony/screens/login_screen.dart';

import 'package:soul_to_soul_matrimony/utilities/static_data.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
// Must add this line.
  await windowManager.ensureInitialized();

// Use it only after calling `hiddenWindowAtLaunch`
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
    exitCallback();
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
          create: (context) => EmployeeController(),
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
            exitCallback();
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
            CreateMaritalProfileScreen.routename: (context) =>
                CreateMaritalProfileScreen(null),
            DashboardScreen.routename: (context) => DashboardScreen(null),
          },
        ),
      ),
    );
  }
}

void exitCallback() async {
  await DatabaseFunctions.markEmployeeOffline(StaticData.emp!.employeeId);
}
