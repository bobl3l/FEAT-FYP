import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'homescreen.dart';
import 'leaderboard.dart';

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
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.0075),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Leaderboard()),
                      );
                    },
                    child: Image.asset(
                      'assets/diet challenge.png',
                      fit: BoxFit.fitWidth,
                      width: size.width * 0.9,
                    )),
              )),
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.0075),
                child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/running challenge.png',
                      fit: BoxFit.fitWidth,
                      width: size.width * 0.9,
                    )),
              )),
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.0075),
                child: InkWell(
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
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
