import 'dart:convert';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'database/database.dart';
import 'components/navbar.dart';
import 'components/mealcard.dart';
import 'targetdetail.dart';
import 'components/alert.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController weightupdate = TextEditingController(text: '');

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: SingleChildScrollView(
        child: Center(
            child: StreamBuilder(
                stream: db.collection('users').doc(user!.id).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: size.width * 0.9,
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.only(
                              top: size.height * 0.08,
                              bottom: size.height * 0.02),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:
                                (snap['date'][snap['date'].length - 1]
                                            .toDate()
                                            .day !=
                                        DateTime.now().day)
                                    ? [
                                        Text(
                                          'Welcome Back!',
                                          style: GoogleFonts.lalezar(
                                              fontSize: size.width * 0.1),
                                        ),
                                        Text(
                                          'Let\' start the day with weighing yourself.',
                                          style: GoogleFonts.lalezar(
                                              fontSize: size.width * 0.045),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(30),
                                          child: FilledButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10))),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          primaryColor),
                                                  padding: MaterialStatePropertyAll(
                                                      EdgeInsets.symmetric(
                                                          horizontal:
                                                              size.width * 0.07,
                                                          vertical:
                                                              size.width * 0.06))),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                          height:
                                                              size.height * 0.2,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Your weight today:',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        size.width *
                                                                            0.05),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    size.height *
                                                                        0.03,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        size.width *
                                                                            0.2,
                                                                    height: size
                                                                            .width *
                                                                        0.18,
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            16,
                                                                        horizontal:
                                                                            16),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        color:
                                                                            primaryColor),
                                                                    child:
                                                                        TextFormField(
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              size.width * 0.05),
                                                                      controller:
                                                                          weightupdate,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        enabledBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: Colors.grey),
                                                                        ),
                                                                        focusedBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: primaryDarkColor),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text('kg',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              size.width * 0.08))
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                'Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed:
                                                                () async {
                                                              await weightRecord(
                                                                  weightupdate
                                                                      .text);
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            HomePage()),
                                                              );
                                                              AlertPopUp(
                                                                  context,
                                                                  'success',
                                                                  'We have recorded your weight today!');
                                                            },
                                                            child: const Text(
                                                                'Update'),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Text(
                                                'Updated your weight today',
                                                style: TextStyle(
                                                    color: primaryDarkColor,
                                                    fontSize:
                                                        size.width * 0.033,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                      ]
                                    : [
                                        Text(
                                          'The grind never stops! Keep up the good work!',
                                          style: GoogleFonts.lalezar(
                                              fontSize: size.width * 0.1),
                                        ),
                                      ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.08,
                                vertical: size.height * 0.015),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Target today',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TargetDetailPage()),
                                    );
                                  },
                                  child: Text(
                                    'View all >>',
                                    style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          width: size.width * 0.9,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(
                                        left: size.width * 0.05,
                                        right: size.width * 0.02,
                                        top: size.width * 0.05,
                                        bottom: size.width * 0.02),
                                    width: size.width * 0.36,
                                    height: size.height * 0.22,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/calories.png"),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Calories',
                                          style: GoogleFonts.inter(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.05),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: size.width * 0.035),
                                              children: [
                                                TextSpan(
                                                    text: localdata?.cal,
                                                    style: TextStyle(
                                                        color: double.parse(
                                                                    localdata!
                                                                        .cal) <
                                                                user!.calories
                                                            ? Colors.blueGrey
                                                            : double.parse(localdata!
                                                                        .cal) ==
                                                                    user!
                                                                        .calories
                                                                ? Colors.white
                                                                : Colors.red)),
                                                TextSpan(
                                                  text:
                                                      ' /${snap['calories']} kcal',
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(
                                        left: size.width * 0.05,
                                        right: size.width * 0.02,
                                        top: size.width * 0.02,
                                        bottom: size.width * 0.02),
                                    width: size.width * 0.36,
                                    height: size.height * 0.28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/sleep.png"),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Sleep',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.05,
                                              color: Colors.white),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: size.width * 0.035),
                                              children: [
                                                TextSpan(
                                                    text: localdata?.sleep,
                                                    style: TextStyle(
                                                        color: double.parse(
                                                                    localdata!
                                                                        .sleep) <
                                                                user!.sleep
                                                            ? Colors.blueGrey
                                                            : Colors.white)),
                                                TextSpan(
                                                  text:
                                                      ' /${snap['sleep']} hrs',
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(
                                        left: size.width * 0.02,
                                        right: size.width * 0.05,
                                        top: size.width * 0.05,
                                        bottom: size.width * 0.02),
                                    width: size.width * 0.36,
                                    height: size.height * 0.28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/exercise.png"),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Exercise',
                                          style: GoogleFonts.inter(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.05),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: size.width * 0.035),
                                              children: [
                                                TextSpan(
                                                    text: localdata?.exercise,
                                                    style: TextStyle(
                                                        color: double.parse(
                                                                    localdata!
                                                                        .exercise) <
                                                                user!.exercise
                                                            ? Colors.blueGrey
                                                            : Colors.white)),
                                                TextSpan(
                                                  text:
                                                      ' /${snap['exercise']} hrs',
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(
                                        left: size.width * 0.02,
                                        right: size.width * 0.05,
                                        top: size.width * 0.02,
                                        bottom: size.width * 0.02),
                                    width: size.width * 0.36,
                                    height: size.height * 0.22,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/water.png"),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Water',
                                          style: GoogleFonts.inter(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.05),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: size.width * 0.035),
                                              children: [
                                                TextSpan(
                                                    text: localdata?.water,
                                                    style: TextStyle(
                                                        color: double.parse(
                                                                    localdata!
                                                                        .water) <
                                                                user!.water
                                                            ? Colors.blueGrey
                                                            : Colors.white)),
                                                TextSpan(
                                                  text:
                                                      ' /${snap['water']} litres',
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.08,
                                vertical: size.height * 0.015),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Meals today',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Add Meal >>',
                                    style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          width: size.width * 0.9,
                          height: size.height * 0.35,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15)),
                          child: FutureBuilder(
                            future: storage.read(key: 'mealstoday'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<dynamic> list =
                                    json.decode(snapshot.data!);

                                return ListView.builder(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    itemCount: list.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    itemBuilder: (context, index) {
                                      return StreamBuilder(
                                          stream: db
                                              .collection('meals')
                                              .doc(list[index])
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              final meals = snapshot.data!;
                                              return mealCard(
                                                  id: meals['id'],
                                                  use: 'list',
                                                  cal: meals['cal'],
                                                  carbs: meals['carbs'],
                                                  cat: meals['cat'],
                                                  direction: meals['direction'],
                                                  fats: meals['fats'],
                                                  ingredient:
                                                      meals['ingredient'],
                                                  name: meals['name'],
                                                  preptime: meals['preptime'],
                                                  protein: meals['protein'],
                                                  type: meals['type']);
                                            } else {
                                              return Padding(
                                                  padding: EdgeInsets.only(
                                                      top: size.height * 0.2,
                                                      bottom:
                                                          size.height * 0.45,
                                                      left: size.width * 0.2,
                                                      right: size.width * 0.2),
                                                  child: LoadingIndicator(
                                                      strokeWidth: 3,
                                                      indicatorType: Indicator
                                                          .lineScalePulseOutRapid,
                                                      colors: [primaryColor]));
                                            }
                                          });
                                    });
                              } else {
                                return Text(
                                  textAlign: TextAlign.center,
                                  'You have not added any meals yet.',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold),
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.2,
                        )
                      ],
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
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
