import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'homescreen.dart';
import 'challenges.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
          child: Stack(
        children: [
          Image.asset(
            'assets/diet challenge.png',
            opacity: AlwaysStoppedAnimation(0.25),
            fit: BoxFit.fitWidth,
            width: size.width,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChallengePage()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        weight: 15,
                        size: size.width * 0.08,
                        color: primaryDarkColor,
                      ),
                    ),
                    Text('LEADERBOARD',
                        style: GoogleFonts.lalezar(
                            fontSize: size.width * 0.1,
                            fontWeight: FontWeight.bold,
                            color: primaryDarkColor)),
                    SizedBox(
                      width: size.width * 0.08,
                    )
                  ],
                ),
                Text('60 days weight loss challenge',
                    style: GoogleFonts.inter(
                      fontSize: size.width * 0.055,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Global',
                        style: TextStyle(fontSize: size.width * 0.04),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: size.width * 0.08,
                                  vertical: size.width * 0.02))),
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Local',
                        style: TextStyle(fontSize: size.width * 0.04),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: size.width * 0.08,
                                  vertical: size.width * 0.02))),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Expanded(
                    flex: 8,
                    child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.06),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width * 0.85,
                                  height: size.height * 0.08,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: primaryDarkColor),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: size.height * 0.06,
                                        height: size.height * 0.06,
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              'assets/man1.png',
                                              fit: BoxFit.contain,
                                              height: size.height * 0.06,
                                            ),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  width: size.height * 0.024,
                                                  height: size.height * 0.024,
                                                  decoration: BoxDecoration(
                                                      color: primaryDarkColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      40))),
                                                )),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Icon(
                                                Icons.emoji_events,
                                                color: Colors.yellow,
                                                size: size.width * 0.036,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: size.width * 0.04),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Name',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: size.width * 0.05),
                                          ),
                                          Text(
                                            'achievement',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: size.width * 0.036),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ))),
              ],
            ),
          ),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
