import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';

class Leaderboard extends StatefulWidget {
  String name;
  CollectionReference usersinfo;
  List prize;
  String img;
  Leaderboard(
      {required this.img,
      required this.name,
      required this.prize,
      required this.usersinfo});
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
          child: StreamBuilder(
              stream: widget.usersinfo
                  .orderBy("stat", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data!.docs;
                  return Stack(children: [
                    Image.network(
                      widget.img,
                      opacity: AlwaysStoppedAnimation(0.25),
                      fit: BoxFit.fitWidth,
                      width: size.width,
                    ),
                    Container(
                        height: size.height,
                        child: Column(children: [
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
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
                              ),
                            ],
                          ),
                          Text(widget.name,
                              style: GoogleFonts.inter(
                                fontSize: size.width * 0.055,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: Container(
                                      width: size.width,
                                      height: size.height * 0.8,
                                      color: Colors.white,
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          bottom: size.height * 0.1),
                                      child: ListView.builder(
                                          itemCount: snap.length,
                                          itemBuilder: ((context, index) {
                                            return Container(
                                                width: size.width * 0.85,
                                                height: size.height * 0.08,
                                                padding: EdgeInsets.all(8),
                                                margin: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: index == 0
                                                        ? primaryDarkColor
                                                        : index == 1
                                                            ? primaryColor
                                                            : index == 2
                                                                ? primaryLightColor
                                                                : Colors
                                                                    .blueGrey
                                                                    .shade50),
                                                child: Row(children: [
                                                  Container(
                                                    width: size.height * 0.06,
                                                    height: size.height * 0.06,
                                                    child: Stack(
                                                      children: [
                                                        Image.asset(
                                                          snap[index]['sex'] ==
                                                                  'male'
                                                              ? 'assets/man' +
                                                                  (Random().nextInt(
                                                                              2) +
                                                                          1)
                                                                      .toString() +
                                                                  '.png'
                                                              : 'assets/woman' +
                                                                  (Random().nextInt(
                                                                              2) +
                                                                          1)
                                                                      .toString() +
                                                                  '.png',
                                                          fit: BoxFit.contain,
                                                          height: size.height *
                                                              0.06,
                                                        ),
                                                        Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Container(
                                                              width:
                                                                  size.height *
                                                                      0.024,
                                                              height:
                                                                  size.height *
                                                                      0.024,
                                                              decoration: BoxDecoration(
                                                                  color: index == 0
                                                                      ? primaryDarkColor
                                                                      : index == 1
                                                                          ? primaryColor
                                                                          : index == 2
                                                                              ? primaryLightColor
                                                                              : Colors.blueGrey.shade50,
                                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))),
                                                            )),
                                                        Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: index == 0
                                                              ? Icon(
                                                                  Icons
                                                                      .emoji_events,
                                                                  color: Colors
                                                                      .yellow,
                                                                  size:
                                                                      size.width *
                                                                          0.036,
                                                                )
                                                              : Text(
                                                                  (index + 1)
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: size.width * 0.04),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snap[index]['name'],
                                                        style: TextStyle(
                                                            color: index > 0
                                                                ? Colors.black
                                                                : Colors.white,
                                                            fontSize:
                                                                size.width *
                                                                    0.05),
                                                      ),
                                                      Text(
                                                        index <
                                                                widget.prize
                                                                    .length
                                                            ? snap[index]
                                                                        ['stat']
                                                                    .toString() +
                                                                ' km - prize: \$' +
                                                                widget.prize[
                                                                        index]
                                                                    .toString()
                                                            : snap[index]
                                                                        ['stat']
                                                                    .toString() +
                                                                ' km',
                                                        style: TextStyle(
                                                            color: index > 0
                                                                ? Colors.black
                                                                : Colors.white
                                                                    .withOpacity(
                                                                        0.8),
                                                            fontSize:
                                                                size.width *
                                                                    0.036),
                                                      )
                                                    ],
                                                  )
                                                ]));
                                          }))))),
                        ])),
                  ]);
                } else {
                  return CircularProgressIndicator();
                }
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
