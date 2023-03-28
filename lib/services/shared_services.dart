import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SharedService {
  static String token = '';
  static String userID = '';
  static String userName = '';
  static String email = '';
  static int contact = 0;
  static String dob = '';
  static String gender = '';
  static LatLng currentPosition = const LatLng(0, 0);
  static Color primaryColor = const Color.fromARGB(255, 24, 209, 219);
}
