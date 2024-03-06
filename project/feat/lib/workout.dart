import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';

class Workout extends StatefulWidget {
  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
          child: Stack(
        children: [
          Image.network(
            "https://media.istockphoto.com/id/1331293694/photo/determined-african-woman-in-sportswear-exercising-with-elastic-band.jpg?s=612x612&w=0&k=20&c=PdMOtf7-WI9KZ1NmXZDCiDt9CJXnkAzN8DIv6ll44aA=",
            opacity: AlwaysStoppedAnimation(0.25),
            fit: BoxFit.fitWidth,
            width: size.width,
          ),
          Container(
            child: Column(
              children: [
                Text('Today\'s Workout',
                    style: GoogleFonts.inter(
                        fontSize: size.width * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(
                  height: size.height * 0.15,
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
                                Text('Title',
                                    style: GoogleFonts.inter(
                                        fontSize: size.width * 0.1,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('Descriptions:',
                                    style: GoogleFonts.inter(
                                        fontSize: size.width * 0.05,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ]),
                        ))),
                Divider(),
                Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: Row()),
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
