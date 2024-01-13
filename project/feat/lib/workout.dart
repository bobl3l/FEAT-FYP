import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'homescreen.dart';
import 'components/workoutcard.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(25))),
              height: size.height * 0.18,
              width: size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'You must be here for the first time.\nLet\'s get started with  choosing a workout plan.',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.048),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'customize your own >>',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontSize: size.width * 0.03),
                        )),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'For Beginners',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all >>',
                        style: GoogleFonts.inter(
                            color: primaryDarkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                )),
            Container(
                height: size.height * 0.2,
                width: size.width,
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.02),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    WorkoutCard(),
                  ],
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Advanced Program',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all >>',
                        style: GoogleFonts.inter(
                            color: primaryDarkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                )),
            Container(
                height: size.height * 0.2,
                width: size.width,
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.02),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    WorkoutCard(),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: size.height * 0.1,
        padding: EdgeInsets.all(20),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: primaryLightColor),
        child: Container(
          padding: EdgeInsets.all(1),
          height: size.height * 0.13,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: primaryColor),
          child: IconButton(
            icon: Icon(Icons.home_rounded),
            iconSize: size.width * 0.07,
            color: primaryDarkColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: navBar(),
    );
  }
}
