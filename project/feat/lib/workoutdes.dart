import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'homescreen.dart';
import 'components/workoutcard.dart';

class WorkoutDescription extends StatefulWidget {
  String name;
  String image;
  String des;
  String lvl;
  String cat;
  String duration;
  String frquency;
  String equipment;
  WorkoutDescription(
      {required this.name,
      required this.image,
      required this.des,
      required this.cat,
      required this.lvl,
      required this.duration,
      required this.frquency,
      required this.equipment});
  @override
  _WorkoutDescriptionState createState() => _WorkoutDescriptionState();
}

class _WorkoutDescriptionState extends State<WorkoutDescription> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
        child: Stack(
          children: [
            Image.network(
              widget.image,
              fit: BoxFit.cover,
              opacity: AlwaysStoppedAnimation(0.65),
              height: size.height,
            ),
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0.7, 1.5),
                  colors: [Color(0x000047FF), Color(0xFF0065FF)],
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  height: size.height * 0.55,
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(width: 3, color: Colors.white)),
                  child: Column(
                    children: [
                      Container(
                        width: size.width * 0.75,
                        height: size.height * 0.12,
                        color: primaryDarkColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.name,
                              style: GoogleFonts.lalezar(
                                  color: Colors.white,
                                  fontSize: size.width * 0.065,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              widget.des,
                              style: GoogleFonts.lalezar(
                                  color: Colors.white,
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Duration:',
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: size.width * 0.03,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.duration + ' weeks',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  'Fitness Level:',
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: size.width * 0.03,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.lvl,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  'Category:',
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: size.width * 0.03,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.cat,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Frequency:',
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: size.width * 0.03,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.frquency + ' days/ week',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  'Equipments:',
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: size.width * 0.03,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.equipment,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      FilledButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  MaterialStateProperty.all(primaryDarkColor),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: size.width * 0.07,
                                      vertical: size.width * 0.06))),
                          onPressed: () {},
                          child: Text(
                            'Choose this workout',
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
