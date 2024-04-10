import 'dart:convert';
import 'package:feat/constants.dart';
import 'package:flutter/material.dart';

class Localdata {
  dynamic cal;
  dynamic sleep;
  dynamic exercise;
  dynamic water;
  dynamic protein;
  dynamic carb;
  dynamic fats;
  dynamic mealstoday;
  Localdata(
      {this.cal,
      this.exercise,
      this.sleep,
      this.water,
      this.mealstoday,
      this.carb,
      this.fats,
      this.protein});
  factory Localdata.fromstorage(Map data) {
    return Localdata(
      cal: data['cal'],
      protein: data['protein'],
      fats: data['fats'],
      carb: data['carb'],
      exercise: data['exercise'],
      sleep: data['sleep'],
      water: data['water'],
      mealstoday: data['mealstoday'],
    );
  }

  Future updatedata(String data, String input) async {
    String? a = await storage.read(key: data);
    double x = double.parse(a!);
    x += double.parse(input);
    await storage.write(key: data, value: x.toString());
    localdata = await getLocalData();
  }

  Future addmeal(String id) async {
    String? temp = await storage.read(key: 'mealstoday');
    if (temp == null) {
      await resetLocalData();
      temp = await storage.read(key: 'mealstoday');
    }
    List<dynamic> list = jsonDecode(temp!);
    list.add(id);
    await storage.write(key: 'mealstoday', value: jsonEncode(list));
  }
}

Future<bool> dataCheck() async {
  bool test = false;
  Map<String, String> allValues = await storage.readAll();
  if (allValues['mealstoday'] != null &&
      allValues['cal'] != null &&
      allValues['carb'] != null &&
      allValues['protein'] != null &&
      allValues['fats'] != null &&
      allValues['water'] != null &&
      allValues['sleep'] != null &&
      allValues['exercise'] != null) {
    test = true;
  }
  return test;
}

Future<Localdata> getLocalData() async {
  Localdata localdata = Localdata();
  Map<String, String> allValues = await storage.readAll();

  localdata = Localdata.fromstorage(allValues);
  return localdata;
}

Future<void> resetLocalData() async {
  await storage.write(key: 'cal', value: '0');
  await storage.write(key: 'carb', value: '0');
  await storage.write(key: 'protein', value: '0');
  await storage.write(key: 'fats', value: '0');
  await storage.write(key: 'water', value: '0');
  await storage.write(key: 'sleep', value: '0');
  await storage.write(key: 'exercise', value: '0');
  await storage.write(key: 'mealstoday', value: '[]');
}
