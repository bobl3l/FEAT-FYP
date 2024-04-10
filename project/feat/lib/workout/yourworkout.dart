import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../constants.dart';
import '../components/navbar.dart';
import 'package:feat/components/timer.dart';

class YourWorkout extends StatefulWidget {
  @override
  _YourWorkoutState createState() => _YourWorkoutState();
}

class _YourWorkoutState extends State<YourWorkout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
          child: StreamBuilder(
              stream: user!.workout.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data! as DocumentSnapshot;
                  return NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          bottom: PreferredSize(
                            child: Container(),
                            preferredSize: Size(0, 20),
                          ),
                          pinned: false,
                          titleSpacing: 0,
                          automaticallyImplyLeading: false,
                          expandedHeight: size.height * 0.2,
                          flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                  child: Stack(children: [
                            Image.network(
                              snap['image'],
                              opacity: AlwaysStoppedAnimation(0.3),
                              fit: BoxFit.cover,
                              width: size.width,
                            ),
                            Container(
                              height: size.height * 0.2,
                              width: size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color.fromARGB(162, 74, 131, 255),
                                    Colors.transparent
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.05,
                                horizontal: 20,
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Today\'s Workout',
                                    style: GoogleFonts.inter(
                                        fontSize: size.width * 0.1,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: primaryCardColor,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(50),
                                  ),
                                ),
                              ),
                              bottom: -1,
                              left: 0,
                              right: 0,
                            ),
                          ]))),
                        ),
                      ];
                    },
                    body: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Container(
                                  width: size.width,
                                  child: Padding(
                                    padding: EdgeInsets.all(size.width * 0.08),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Chest & Shoulders',
                                              style: GoogleFonts.inter(
                                                fontSize: size.width * 0.075,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Text(
                                              '- Upper body day\n- 6 exercises\n- 1 min rest in between sets',
                                              style: GoogleFonts.inter(
                                                fontSize: size.width * 0.045,
                                                fontWeight: FontWeight.w400,
                                              )),
                                          Divider(),
                                          FutureBuilder(
                                            future: getList(snap["exercises"]),
                                            builder: ((context, snapshot) {
                                              if (snapshot.hasData) {
                                                List exercise = snapshot.data!;
                                                return ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.all(0),
                                                  shrinkWrap: true,
                                                  itemCount: exercise.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      width: size.width * 0.7,
                                                      height:
                                                          size.height * 0.08,
                                                      margin: EdgeInsets.all(4),
                                                      padding:
                                                          EdgeInsets.all(6),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color:
                                                              primaryLightColor),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: size.height *
                                                                0.065,
                                                            height:
                                                                size.height *
                                                                    0.065,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  primaryFillColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              exercise[index]
                                                                  ['image'],
                                                              fit: BoxFit
                                                                  .contain,
                                                              opacity:
                                                                  AlwaysStoppedAnimation(
                                                                      0.5),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.05,
                                                          ),
                                                          Text(
                                                            exercise[index]
                                                                    ['name'] +
                                                                " " +
                                                                exercise[index]
                                                                    ['reps'] +
                                                                ' reps',
                                                            style: GoogleFonts.inter(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                color:
                                                                    primaryDarkColor),
                                                          ),
                                                          SizedBox.shrink()
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return Padding(
                                                    padding: EdgeInsets.only(
                                                        top: size.height * 0.2,
                                                        bottom:
                                                            size.height * 0.45,
                                                        left: size.width * 0.2,
                                                        right:
                                                            size.width * 0.2),
                                                    child: LoadingIndicator(
                                                        strokeWidth: 3,
                                                        indicatorType: Indicator
                                                            .lineScalePulseOutRapid,
                                                        colors: [
                                                          primaryColor
                                                        ]));
                                              }
                                            }),
                                          ),
                                          TimerClock()
                                        ]),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.2,
                          bottom: size.height * 0.45,
                          left: size.width * 0.2,
                          right: size.width * 0.2),
                      child: LoadingIndicator(
                          strokeWidth: 3,
                          indicatorType: Indicator.lineScalePulseOutRapid,
                          colors: [primaryColor]));
                }
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}

Future<List> getList(dynamic docArray) async {
  List docList = [];
  for (DocumentReference i in docArray) {
    await i.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        docList.add(data);
      },
    );
  }
  print(docList);
  return docList;
}
