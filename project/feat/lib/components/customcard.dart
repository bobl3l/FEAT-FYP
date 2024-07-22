import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feat/constants.dart';

const List<String> lvl = ['Beginner', 'Intermediate', 'Advanced'];
const List<String> type = ['Lose Weight', 'Muscle Building', 'Performance'];
List week = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
List weekselect = [false, false, false, false, false, false, false];

class CustomCard extends StatelessWidget {
  String type;
  CustomCard({required this.type});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))),
      height: size.height * 0.185,
      width: size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'You must be here for the first time.\nLet\'s get started with  choosing a $type plan.',
            style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.048),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Customize()),
                  );
                },
                child: Text(
                  'customize your own >>',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                      decorationColor: Colors.white,
                      fontSize: size.width * 0.045),
                )),
          ),
        ],
      ),
    );
  }
}

class Customize extends StatefulWidget {
  @override
  _CustomizeState createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> {
  final List<bool> _isSelected = [true];
  int exno = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryCardColor,
        body: Center(
          child: Container(
              height: size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Text(
                        'CUSTOM PLAN',
                        style: GoogleFonts.lalezar(
                            fontSize: size.width * 0.1,
                            color: primaryDarkColor),
                      ),
                      SizedBox(
                        width: size.width * 0.15,
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    height: size.height * 0.7,
                    width: size.width * 0.85,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
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
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: DropdownMenu(
                              width: size.width * 0.75,
                              dropdownMenuEntries: lvl
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
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
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: DropdownMenu(
                              width: size.width * 0.75,
                              dropdownMenuEntries: type
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
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
                          Container(
                              height: size.height * 0.06,
                              width: size.width * 0.8,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: week.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                      height: size.width * 0.08,
                                      width: size.width * 0.085,
                                      margin: EdgeInsets.all(4),
                                      child: FilledButton(
                                        onPressed: () {
                                          setState(() {
                                            weekselect[index] =
                                                !weekselect[index];
                                          });
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    weekselect[index]
                                                        ? primaryDarkColor
                                                        : primaryLightColor),
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.all(0))),
                                        child: Text(
                                          week[index],
                                          style: TextStyle(
                                              color: weekselect[index]
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ));
                                },
                              )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Divider(
                              color: Colors.blueGrey,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Exercise List",
                              style: GoogleFonts.inter(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: primaryDarkColor),
                            ),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: exno,
                              itemBuilder: ((context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.45,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 6),
                                                hintStyle: TextStyle(
                                                    color: primaryDarkColor),
                                                hintText: 'Exercise',
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                filled: true,
                                                fillColor: primaryCardColor),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.25,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 6),
                                                hintStyle: TextStyle(
                                                    color: primaryDarkColor),
                                                hintText: 'Duration',
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                filled: true,
                                                fillColor: primaryCardColor),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Divider(
                                        color: primaryLightColor,
                                      ),
                                    ),
                                  ],
                                );
                              })),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    exno++;
                                  });
                                },
                                child: Text('+ exercise')),
                          )
                        ],
                      ),
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
