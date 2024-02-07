import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

const List<String> lvl = ['Beginner', 'Intermediate'];

enum Days { mon, tue, wed, thu, fri, sat, sun }

const List<(Days, String)> DaysOptions = <(Days, String)>[
  (Days.mon, 'M'),
  (Days.tue, 'T'),
  (Days.wed, 'W'),
  (Days.thu, 'T'),
  (Days.fri, 'F'),
  (Days.sat, 'S'),
  (Days.sun, 'S'),
];

class Customize extends StatefulWidget {
  @override
  _CustomizeState createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> {
  final List<bool> _isSelected = [true];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primaryCardColor,
        body: Center(
          child: Container(
              height: size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'CUSTOM PLAN',
                    style: GoogleFonts.lalezar(
                        fontSize: size.width * 0.1, color: primaryDarkColor),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    height: size.height * 0.6,
                    width: size.width * 0.8,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Title'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'Expert Level',
                          style: GoogleFonts.inter(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: primaryDarkColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: DropdownMenu(
                            dropdownMenuEntries: lvl
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'Type',
                          style: GoogleFonts.inter(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: primaryDarkColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: DropdownMenu(
                            dropdownMenuEntries: lvl
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'Days per week',
                          style: GoogleFonts.inter(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: primaryDarkColor),
                        ),
                        ToggleButtons(
                            children: [Text('M')], isSelected: _isSelected),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            color: primaryLightColor,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: size.width * 0.45,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: primaryDarkColor),
                                        hintText: 'Exercise',
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        filled: true,
                                        fillColor: primaryCardColor),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.25,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: primaryDarkColor),
                                        hintText: 'Duration',
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        filled: true,
                                        fillColor: primaryCardColor),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Divider(
                                color: primaryLightColor,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () {}, child: Text('+ exercise')),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: FilledButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor: MaterialStateProperty.all(
                                      primaryDarkColor),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: size.width * 0.07,
                                          vertical: size.width * 0.04))),
                              onPressed: () {},
                              child: Text(
                                '+   CREATE',
                                style: GoogleFonts.lalezar(
                                  color: Colors.white,
                                  fontSize: size.width * 0.065,
                                ),
                              )),
                        )),
                  )
                ],
              )),
        ));
  }
}
