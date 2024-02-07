import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'components/mealcard.dart';
import 'homescreen.dart';

class TargetDetailPage extends StatefulWidget {
  @override
  _TargetDetailPageState createState() => _TargetDetailPageState();
}

class _TargetDetailPageState extends State<TargetDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      height: size.height * 0.12,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Calories',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: size.width * 0.042),
                              ),
                              Image.asset(
                                'assets/kcal.png',
                                fit: BoxFit.contain,
                                height: size.height * 0.035,
                              )
                            ],
                          ),
                          Text(
                            '70%',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07),
                          ),
                          Container(
                            height: 10,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 0.7,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffA6FF98)),
                                backgroundColor: Color(0xff66A95C),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      height: size.height * 0.12,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Protein',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: size.width * 0.042),
                              ),
                              Image.asset(
                                'assets/protein.png',
                                fit: BoxFit.contain,
                                height: size.height * 0.035,
                              )
                            ],
                          ),
                          Text(
                            '70%',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07),
                          ),
                          Container(
                            height: 10,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 0.7,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffFF7E7E)),
                                backgroundColor: Color(0xffBA4141),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      height: size.height * 0.12,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Carbs',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: size.width * 0.042),
                              ),
                              Image.asset(
                                'assets/carbs.png',
                                fit: BoxFit.contain,
                                height: size.height * 0.035,
                              )
                            ],
                          ),
                          Text(
                            '50%',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07),
                          ),
                          Container(
                            height: 10,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 0.7,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xff98CEFF)),
                                backgroundColor: Color(0xff5C8DA9),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      height: size.height * 0.12,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fats',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: size.width * 0.042),
                              ),
                              Image.asset(
                                'assets/fats.png',
                                fit: BoxFit.contain,
                                height: size.height * 0.035,
                              )
                            ],
                          ),
                          Text(
                            '70%',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07),
                          ),
                          Container(
                            height: 10,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 0.7,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffFDFF98)),
                                backgroundColor: Color(0xff808241),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  height: size.height * 0.12,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Water',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: size.width * 0.042),
                          ),
                          Image.asset(
                            'assets/watercup.png',
                            fit: BoxFit.contain,
                            height: size.height * 0.035,
                          )
                        ],
                      ),
                      Text(
                        '50%',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.07),
                      ),
                      Container(
                        height: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.7,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff98F9FF)),
                            backgroundColor: Color(0xff5CA4A9),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  height: size.height * 0.12,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Exercise',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: size.width * 0.042),
                          ),
                          Image.asset(
                            'assets/weights.png',
                            fit: BoxFit.contain,
                            height: size.height * 0.035,
                          )
                        ],
                      ),
                      Text(
                        '50%',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.07),
                      ),
                      Container(
                        height: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.7,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff96A2A3)),
                            backgroundColor: Color(0xff4D5353),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
