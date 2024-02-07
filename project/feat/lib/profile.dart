import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'homescreen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'components/chart.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: size.height * 0.22,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/profile bg.png'),
                        colorFilter: ColorFilter.mode(
                            primaryColor.withOpacity(0.4), BlendMode.dstATop),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.settings_rounded,
                          size: size.width * 0.1,
                          color: primaryDarkColor,
                        )),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: primaryDarkColor, width: 10)),
                          width: size.width * 0.2,
                          height: size.width * 0.2,
                          child: Icon(
                            Icons.person,
                            size: size.width * 0.1,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Container(
                          width: size.width * 0.5,
                          height: size.height * 0.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Username',
                                style: GoogleFonts.lalezar(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: primaryDarkColor),
                              ),
                              Text('Lv. 10',
                                  style: GoogleFonts.lalezar(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold,
                                      color: primaryDarkColor)),
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: size.width * 0.024),
                                    width: size.width * 0.4,
                                    height: size.height * 0.02,
                                    child: LinearPercentIndicator(
                                      padding: EdgeInsets.all(0),
                                      width: size.width * 0.35,
                                      lineHeight: size.height * 0.02,
                                      percent: 0.4,
                                      backgroundColor: Colors.white,
                                      progressColor: primaryColor,
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.4,
                                    child: Image.asset(
                                      'assets/Rectangle.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: size.height * 0.2,
                ),
                padding: EdgeInsets.all(size.width * 0.05),
                width: size.width,
                height: size.height * 0.8,
                decoration: BoxDecoration(
                    color: primaryCardColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Progress',
                      style: GoogleFonts.inter(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: primaryDarkColor),
                    ),
                    Container(
                      height: size.height * 0.3,
                      width: size.width * 0.9,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primaryLightColor),
                      child: Column(
                        children: [
                          ToggleSwitch(
                            minWidth: size.width * 0.428,
                            initialLabelIndex: 0,
                            totalSwitches: 2,
                            cornerRadius: 15,
                            radiusStyle: true,
                            activeBorders: [
                              Border.all(
                                color: primaryDarkColor.withOpacity(0.3),
                                width: 2.0,
                              ),
                            ],
                            labels: ['Weight', 'Calories'],
                            activeBgColor: [primaryLightColor],
                            inactiveBgColor: Colors.blueGrey,
                            activeFgColor: primaryDarkColor,
                            inactiveFgColor: Colors.white,
                            customTextStyles: [
                              GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.03)
                            ],
                            onToggle: (index) {},
                          ),
                          Chart(),
                        ],
                      ),
                    ),
                    Text(
                      'Your achievements',
                      style: GoogleFonts.inter(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: primaryDarkColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 30),
                      width: size.width,
                      height: size.height * 0.4,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: size.width * 0.03,
                                  crossAxisSpacing: size.width * 0.03,
                                  crossAxisCount: 3),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            return Container(
                              width: size.width * 0.3,
                              height: size.width * 0.3,
                              child: Center(
                                  child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      width: size.width * 0.25,
                                      height: size.width * 0.25,
                                      decoration: ShapeDecoration(
                                        color: trophyColor,
                                        shape: StarBorder.polygon(
                                          sides: 6,
                                          pointRounding: 0.3,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: size.width * 0.065,
                                    top: size.width * 0.06,
                                    child: Icon(
                                      Icons.military_tech_rounded,
                                      size: size.width * 0.15,
                                      color: primaryDarkColor,
                                    ),
                                  ),
                                  Positioned(
                                    left: size.width * 0.04,
                                    top: size.width * 0.19,
                                    child: Container(
                                      width: size.width * 0.06,
                                      height: size.width * 0.06,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFFCFF99),
                                        shape: StarBorder(
                                          points: 5,
                                          innerRadiusRatio: 0.5,
                                          pointRounding: 0.3,
                                          valleyRounding: 0,
                                          rotation: 0,
                                          squash: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: size.width * 0.11,
                                    top: size.width * 0.21,
                                    child: Container(
                                      width: size.width * 0.06,
                                      height: size.width * 0.06,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFFCFF99),
                                        shape: StarBorder(
                                          points: 5,
                                          innerRadiusRatio: 0.5,
                                          pointRounding: 0.3,
                                          valleyRounding: 0,
                                          rotation: 0,
                                          squash: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: size.width * 0.18,
                                    top: size.width * 0.19,
                                    child: Container(
                                      width: size.width * 0.06,
                                      height: size.width * 0.06,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFFCFF99),
                                        shape: StarBorder(
                                          points: 5,
                                          innerRadiusRatio: 0.5,
                                          pointRounding: 0.3,
                                          valleyRounding: 0,
                                          rotation: 0,
                                          squash: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
