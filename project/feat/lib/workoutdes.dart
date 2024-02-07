import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'homescreen.dart';
import 'components/workoutcard.dart';

class WorkoutDescription extends StatefulWidget {
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
              "https://media.istockphoto.com/id/1331293694/photo/determined-african-woman-in-sportswear-exercising-with-elastic-band.jpg?s=612x612&w=0&k=20&c=PdMOtf7-WI9KZ1NmXZDCiDt9CJXnkAzN8DIv6ll44aA=",
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
                              'title',
                              style: GoogleFonts.lalezar(
                                  color: Colors.white,
                                  fontSize: size.width * 0.065,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'short description',
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
                                  '-- weeks',
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
                                  'Beginner',
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
                                  'Muscle',
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
                                  'days/ week',
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
                                  'Beginner',
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
