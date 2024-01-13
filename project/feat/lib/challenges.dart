import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'homescreen.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('CHALLENGES',
              style: GoogleFonts.lalezar(
                  fontSize: size.width * 0.12,
                  fontWeight: FontWeight.bold,
                  color: primaryDarkColor)),
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.0075),
                child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {},
                    child: Image.asset(
                      'assets/diet challenge.png',
                      fit: BoxFit.fitWidth,
                      width: size.width * 0.9,
                    )),
              )),
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.0075),
                child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {},
                    child: Image.asset(
                      'assets/running challenge.png',
                      fit: BoxFit.fitWidth,
                      width: size.width * 0.9,
                    )),
              )),
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.0075),
                child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {},
                    child: Image.asset(
                      'assets/weightlifting challenge.png',
                      fit: BoxFit.fitWidth,
                      width: size.width * 0.9,
                    )),
              )),
        ],
      )),
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
