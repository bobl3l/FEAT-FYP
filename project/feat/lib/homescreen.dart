import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'components/mealcard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome Back!',
                style: GoogleFonts.lalezar(fontSize: size.width * 0.13),
              ),
              Text(
                'The grind never stops! Keep up the good work!',
                style: GoogleFonts.lalezar(fontSize: size.width * 0.05),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: FilledButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.06,
                            vertical: size.width * 0.06))),
                    onPressed: () {},
                    child: Text(
                      'Updated your weight today',
                      style: TextStyle(
                          color: primaryDarkColor,
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Target today',
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all >>',
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        width: size.width * 0.35,
                        height: size.height * 0.20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("assets/calories.png"),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Calories',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '1300/2000 kcal',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                        width: size.width * 0.35,
                        height: size.height * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("assets/sleep.png"),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sleep',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '1.0/7.5 hrs',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                        width: size.width * 0.35,
                        height: size.height * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("assets/exercise.png"),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exercise',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '0.5/2.0 hrs',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                        width: size.width * 0.35,
                        height: size.height * 0.20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("assets/water.png"),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Water',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '2.5/5 Litres',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Meals Today',
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Add meal >>',
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // mealCard(),
                ],
              ),
              SizedBox(
                height: size.height * 0.2,
              )
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
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
