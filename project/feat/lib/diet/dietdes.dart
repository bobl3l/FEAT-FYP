import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../components/navbar.dart';
import '../homescreen.dart';
import 'dietlist.dart';

class DietDescription extends StatefulWidget {
  String protein;
  String fat;
  String carb;
  String cal;
  String name;
  String time;
  DietDescription(
      {required this.protein,
      required this.fat,
      required this.carb,
      required this.cal,
      required this.name,
      required this.time});
  @override
  _DietDescriptionState createState() => _DietDescriptionState();
}

class _DietDescriptionState extends State<DietDescription> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              "assets/dietbg.jpg",
              fit: BoxFit.cover,
              height: size.height,
            ),
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0.7, 1.5),
                  colors: [
                    Colors.grey.withOpacity(0.05),
                    Colors.green.withOpacity(0.7)
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  height: size.height * 0.55,
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                      color: Colors.green.shade400,
                      border: Border.all(width: 3, color: Colors.greenAccent)),
                  child: Column(
                    children: [
                      Container(
                        width: size.width * 0.75,
                        height: size.height * 0.12,
                        color: Colors.greenAccent.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.name,
                              style: GoogleFonts.lalezar(
                                  color: Colors.green.shade400,
                                  fontSize: size.width * 0.065,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'by FEAT nutrition',
                              style: GoogleFonts.lalezar(
                                  color: Colors.green.shade400,
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.3,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: size.width * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Protein:',
                                      style: GoogleFonts.inter(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      widget.protein + ' g',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Text(
                                      'Carbs:',
                                      style: GoogleFonts.inter(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      widget.carb + ' g',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Text(
                                      'Fats:',
                                      style: GoogleFonts.inter(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      widget.fat + ' g',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                            Container(
                                width: size.width * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Average Calories:',
                                      maxLines: 3,
                                      style: GoogleFonts.inter(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      widget.cal + ' kcal',
                                      maxLines: 3,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Text(
                                      'Average prep time:',
                                      maxLines: 3,
                                      style: GoogleFonts.inter(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      widget.time + ' min',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      FilledButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.green.shade700),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: size.width * 0.07,
                                      vertical: size.width * 0.06))),
                          onPressed: () {},
                          child: Text(
                            'Choose this diet',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.03,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
