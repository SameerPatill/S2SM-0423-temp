import 'package:soul_to_soul_admin/constants.dart';
import 'package:flutter/material.dart';

class ClientCount {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  ClientCount({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoClients = [
  ClientCount(
    title: "Males",
    numOfFiles: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "",
    color: primaryColor,
    percentage: 100,
  ),
  ClientCount(
    title: "Females",
    numOfFiles: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "",
    color: Color(0xFFFFA113),
    percentage: 100,
  ),
  ClientCount(
    title: "Total Profiles",
    numOfFiles: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  ClientCount(
    title: "Your Registered Profiles",
    numOfFiles: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
