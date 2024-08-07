import 'package:feat/database/user.dart';
import 'package:feat/localData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

const primaryColor = Color(0xFF9FBCFA);
const primaryLightColor = Color(0xFFC5D6FA);
const primaryCardColor = Color(0xFFEDF3FF);
const primaryFillColor = Color(0xFF7EA4F5);
const primaryDarkColor = Color(0xFF324262);
const trophyColor = Color.fromARGB(255, 200, 218, 255);

final storage = new FlutterSecureStorage();

UserDetails? user;
Localdata? localdata;
