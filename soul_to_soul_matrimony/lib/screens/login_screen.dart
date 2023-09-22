import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';
import 'package:provider/provider.dart';
import 'package:soul_to_soul_matrimony/controllers/EmployeeController.dart';
import 'package:soul_to_soul_matrimony/controllers/MenuAppController.dart';
import 'package:soul_to_soul_matrimony/models/s2sm_employee.dart';
import 'package:soul_to_soul_matrimony/models/database_functions.dart';
import 'package:soul_to_soul_matrimony/screens/main/main_screen.dart';
import 'package:soul_to_soul_matrimony/utilities/static_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int currentIndex = 0;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      Column(
        children: [
          Image.asset(
            'assets/images/Login1.jpg',
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.15,
              // color: Colors.black,
              child: Text(
                "Seamless Access Awaits",
                style: GoogleFonts.nunito(
                  fontSize: 34,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Text(
                "Effortless entry is ready for you. Just a click away, your access is smooth and easy. Your pathway to data is clear and unhindered, waiting for your arrival.",
                style: GoogleFonts.nunito(
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Image.asset(
            'assets/images/Login2.jpg',
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.15,
              // color: Colors.black,
              child: Text(
                "Authorized Users Welcome",
                style: GoogleFonts.nunito(
                  fontSize: 34,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Text(
                "Protected content within. Access reserved for individuals with the appropriate credentials. Unauthorized entry is restricted. Your key to exclusive information.",
                style: GoogleFonts.nunito(
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Image.asset(
            'assets/images/Login3.jpg',
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.15,
              // color: Colors.black,
              child: Text(
                "Centralised Data Access",
                style: GoogleFonts.nunito(
                  fontSize: 34,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Text(
                "Discover the convenience of a unified data gateway, where all your essential data converges for effortless retrieval and utilization.",
                style: GoogleFonts.nunito(
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    ];

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Image.asset('assets/images/logo.jpg'),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.7,
                            autoPlay: items.length > 1 ? true : false,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 1),
                            // enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                          items: items,
                        ),
                        DotsIndicator(
                          dotsCount: items.length,
                          position: currentIndex.toInt(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Stack(
                      children: [
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.15,
                          left: MediaQuery.of(context).size.width * 0.1,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Color.fromARGB(255, 226, 226, 226),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.04,
                                    left: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  child: Text(
                                    "Login to your account",
                                    style: GoogleFonts.nunito(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.03,
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: MaterialTextField(
                                        keyboardType: TextInputType.text,
                                        style: GoogleFonts.nunito(),
                                        hint: 'Employee ID',
                                        labelText: 'Employee ID',
                                        textInputAction: TextInputAction.next,
                                        prefixIcon: const Icon(
                                            Icons.person_outline_rounded),
                                        controller: _usernameController,
                                        validator:
                                            FormValidation.emailTextField,
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.04,
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: MaterialTextField(
                                        obscureText: true,
                                        keyboardType: TextInputType.text,
                                        hint: 'Password',
                                        labelText: 'Password',
                                        textInputAction: TextInputAction.next,
                                        prefixIcon:
                                            const Icon(Icons.password_rounded),
                                        controller: _passwordController,
                                        validator:
                                            FormValidation.emailTextField,
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.035,
                                    left: MediaQuery.of(context).size.width *
                                        0.025,
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Having trouble signing in?",
                                      style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.51,
                          left: MediaQuery.of(context).size.width * 0.35,
                          child: InkWell(
                            splashColor: Colors.red.shade300,
                            onTap: () async {
                              int returnStatus =
                                  await DatabaseFunctions.authenticateEmployee(
                                      _usernameController.text.toString(),
                                      _passwordController.text.toString());
                              if (returnStatus == 1) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Authenticated Successfully")));

                                Provider.of<EmployeeController>(context,
                                        listen: false)
                                    .setCurrentEmployee(await DatabaseFunctions
                                        .getEmployeeDetails(_usernameController
                                            .text
                                            .toString()));
                                StaticData.emp =
                                    await DatabaseFunctions.getEmployeeDetails(
                                        _usernameController.text.toString());
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ));
                              } else if (returnStatus == 0) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Employee "${_usernameController.text.toString()}" is restricted from accessing the system. Kindly Contact Admin')));
                              } else if (returnStatus == -1) {
                                const SnackBar(
                                    content: Text("Incorrect Password"));
                              } else if (returnStatus == -2) {
                                const SnackBar(
                                    content: Text("Technical Issue"));
                              }
                            },
                            child: CircleAvatar(
                                radius: 35,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child:
                                      Image.asset('assets/images/loginbtn.png'),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
