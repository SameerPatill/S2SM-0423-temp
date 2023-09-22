// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';
import 'package:provider/provider.dart';
import 'package:soul_to_soul_matrimony/constants.dart';
import 'package:soul_to_soul_matrimony/controllers/MenuAppController.dart';
import 'package:soul_to_soul_matrimony/models/gender.dart';
import 'package:soul_to_soul_matrimony/screens/dashboard/components/dashboard_header.dart';
import 'package:soul_to_soul_matrimony/widgets/custom_gender_radio.dart';

class CreateMaritalProfileScreen extends StatefulWidget {
  static const String routename = "/create-marital-profile";
  CreateMaritalProfileScreen(this.setStateCallBack);
  Function? setStateCallBack;
  @override
  State<CreateMaritalProfileScreen> createState() =>
      _CreateMaritalProfileScreenState();
}

class _CreateMaritalProfileScreenState
    extends State<CreateMaritalProfileScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
        title: Text(
          'Personal Details',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: PersonalDetailsForm(),
        isActive: currentStep == 0 ? true : false,
      ),
      Step(
        title: Text(
          'Career Details',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: CareerDetails(),
        isActive: currentStep == 1 ? true : false,
      ),
      Step(
        title: Text(
          'Family Details',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: FamilyDetails(),
        isActive: currentStep == 2 ? true : false,
      ),
      Step(
        title: Text(
          'Save Profile',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: const Text('Review and save your profile'),
        isActive: currentStep == 3 ? true : false,
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
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
                      "Create Matrimonial\nProfile",
                      style: GoogleFonts.nunito(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    // Text(        //Not necessary
                    //   "Profile",
                    //   style: GoogleFonts.nunito(
                    //     fontSize: 34,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.grey.shade600,
                    //   ),
                    // ),
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
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height,
                child: Stepper(
                  elevation: 0,
                  type: StepperType.horizontal,
                  steps: steps,
                  controlsBuilder: (context, details) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        right: MediaQuery.of(context).size.width * 0.09,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.grey,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: const BorderSide(color: Colors.grey)),
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.023,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ),
                            onPressed: details.currentStep == 0
                                ? () {}
                                : details.onStepCancel,
                            child: Text(
                              details.currentStep == 0 ? "Clear" : "Back",
                              style: GoogleFonts.nunito(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              // backgroundColor: Colors.transparent,
                              // foregroundColor: Colors.grey,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                // side: BorderSide(color: Colors.grey),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.023,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ),
                            onPressed: details.onStepContinue,
                            child: details.currentStep < steps.length - 1
                                ? Text(
                                    "Continue",
                                    style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    "Save",
                                    style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                  currentStep: currentStep,
                  onStepTapped: (step) {
                    setState(() {
                      currentStep = step;
                    });
                  },
                  onStepContinue: () {
                    if (currentStep < steps.length - 1) {
                      setState(() {
                        currentStep += 1;
                      });
                    } else {
                      // Handle saving the profile
                      // You can navigate to a success screen or perform any other action here.
                      // For simplicity, we'll just show a snackbar.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile saved!'),
                        ),
                      );
                    }
                  },
                  onStepCancel: () {
                    if (currentStep > 0) {
                      setState(() {
                        currentStep -= 1;
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalDetailsForm extends StatefulWidget {
  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final List<DropdownMenuItem> _items = [
    DropdownMenuItem(
      value: "Hindu",
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.people_outline_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Hindu"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: "Jain",
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.people_outline_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Jain"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: "Sikh",
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.people_outline_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Sikh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: "Muslim",
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.people_outline_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Muslim"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: "Christian",
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.people_outline_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Christian"),
          ),
        ],
      ),
    ),
  ];

  bool mayHaveChildren = false;

  List<Gender> genders = [];

  @override
  void initState() {
    super.initState();
    genders.add(Gender("Male", Icons.male_outlined, false));
    genders.add(Gender("Female", Icons.female_outlined, false));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Details',
          style: GoogleFonts.nunito(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.03,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'First Name',
                labelText: 'First Name',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.person_outline_rounded),
                controller: null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Middle Name',
                labelText: 'Middle Name',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.person_outline_rounded),
                controller: null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Last Name',
                labelText: 'Last Name',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.person_outline_rounded),
                controller: null,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.025,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.15,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Date of Birth',
                labelText: 'Date of Birth',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.calendar_month_rounded),
                controller: null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Mobile Number',
                labelText: 'Mobile Number',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.smartphone_rounded),
                controller: null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: genders.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.pinkAccent,
                      onTap: () {
                        setState(() {
                          genders
                              .forEach((gender) => gender.isSelected = false);
                          genders[index].isSelected = true;
                        });
                      },
                      child: CustomRadio(genders[index]),
                    );
                  }),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.025,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.16,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Mother Tongue',
                labelText: 'Mother Tongue',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.person_outline_rounded),
                controller: null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: DropdownButtonFormField(
                items: _items,
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.people_outline_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Religion"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
              //   MaterialTextField(
              //     keyboardType: TextInputType.text,
              //     style: GoogleFonts.nunito(),
              //     hint: 'Religion',
              //     labelText: 'Religion',
              //     textInputAction: TextInputAction.next,
              //     prefixIcon: const Icon(Icons.calendar_month_rounded),
              //     controller: null,
              //   ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Caste',
                labelText: 'Caste',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.category_outlined),
                controller: null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.22,
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.lens_blur_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Must"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.lens_blur_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Not Necessary"),
                        ),
                      ],
                    ),
                  ),
                ],
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.lens_blur_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Horoscope Match is Necessary ?"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.025,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Height',
                labelText: 'Height',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.height_rounded),
                controller: null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.14,
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.people_outline,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Never Married"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.people_outline,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Awaiting Divorce"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.people_outline,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Divorced"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.people_outline,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Widowed"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.people_outline,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Annulled"),
                        ),
                      ],
                    ),
                  ),
                ],
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.people_outline,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Marital Status"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.18,
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.child_friendly_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("No"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.child_friendly_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Yes, Living Together"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.child_friendly_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Yes, Living Separately"),
                        ),
                      ],
                    ),
                  ),
                ],
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.child_friendly_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Have Children?"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.16,
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.lens_blur_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Manglik"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.lens_blur_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Non Manglik"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.lens_blur_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Anshik Manglik"),
                        ),
                      ],
                    ),
                  ),
                ],
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.lens_blur_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Are you Manglik ?"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.02,
            // ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.2,
            //   child: MaterialTextField(
            //     keyboardType: TextInputType.text,
            //     style: GoogleFonts.nunito(),
            //     hint: 'Mother Tongue',
            //     labelText: 'Mother Tongue',
            //     textInputAction: TextInputAction.next,
            //     prefixIcon: const Icon(Icons.person_outline_rounded),
            //     controller: null,
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.025,
        ),
      ],
    );
  }
}

class CareerDetails extends StatefulWidget {
  @override
  State<CareerDetails> createState() => _CareerDetailsState();
}

class _CareerDetailsState extends State<CareerDetails> {
  final List<DropdownMenuItem> _items = [
    DropdownMenuItem(
      value: 0,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("0 - 1 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 1,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("1 - 2 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 2,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("2 - 3 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 3,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("4 - 5 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 4,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("5 - 8 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 5,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("8 - 10 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 6,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("10 - 15 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 7,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("15 - 20 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 8,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("20 - 25 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 9,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("25 - 30 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 10,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("30 - 35 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 11,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("35 - 40 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 12,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("40 - 45 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 13,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("45 - 50 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 14,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("50 - 70 Lakh"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 15,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("70 Lakh - 1 Crore"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 16,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("1 Crore & Above"),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Career Details',
          style: GoogleFonts.nunito(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.03,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'City',
                labelText: 'City',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.location_city_rounded),
                controller: null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'State',
                labelText: 'State',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.location_city_rounded),
                controller: null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Country',
                labelText: 'Country',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.language_outlined),
                controller: null,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.025,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.work,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Private Sector"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.work,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Government / Public Sector"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.work,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Civil Services"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.work,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Defense"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.work,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Business / Self Employeed"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 5,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.work,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Not Working"),
                        ),
                      ],
                    ),
                  ),
                ],
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.work,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Employeed In"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: DropdownButtonFormField(
                items: _items,
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.currency_rupee_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Annual Income"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Highest Degree',
                labelText: 'Highest Degree',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.hail_outlined),
                controller: null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FamilyDetails extends StatefulWidget {
  @override
  State<FamilyDetails> createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetails> {
  final List<DropdownMenuItem> _fatherOccupation = [
    DropdownMenuItem(
      value: 0,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Business / Self-Employeed"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 1,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Service - Private"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 2,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Service - Government"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 3,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Army / Armed Force"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 4,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Civil Services"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 5,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Retired"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 6,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Not Employeed"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 7,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Expired"),
          ),
        ],
      ),
    ),
  ];

  final List<DropdownMenuItem> _motherOccupation = [
    DropdownMenuItem(
      value: 0,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Business / Self-Employeed"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 1,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Service - Private"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 2,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Service - Government"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 3,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Army / Armed Force"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 4,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Civil Services"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 5,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Retired"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 6,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Housewife"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 7,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Expired"),
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 8,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.currency_rupee_rounded,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Teacher"),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Career Details',
          style: GoogleFonts.nunito(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.03,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.family_restroom_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Joint Family"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.family_restroom_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Nuclear Family"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.family_restroom_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Others"),
                        ),
                      ],
                    ),
                  ),
                ],
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.family_restroom_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Family Type"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: DropdownButtonFormField(
                items: _fatherOccupation,
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.work,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Father's Occupation"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: DropdownButtonFormField(
                items: _motherOccupation,
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.work,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Mother's Occupation"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.025,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Family Living In',
                labelText: 'Family Living In',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.location_city_rounded),
                controller: null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.42,
              child: MaterialTextField(
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(),
                hint: 'Contact Address',
                labelText: 'Contact Address',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.contact_page_outlined),
                controller: null,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.03,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.31,
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.boy_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("None"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.boy_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("1"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.boy_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("2"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.boy_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("3"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.boy_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("3+"),
                        ),
                      ],
                    ),
                  ),
                ],
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.boy_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Brother"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.31,
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.girl_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("None"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.girl_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("1"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.girl_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("2"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.girl_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("3"),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.girl_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("3+"),
                        ),
                      ],
                    ),
                  ),
                ],
                focusColor: Colors.white,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                hint: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.girl_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Sister"),
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
