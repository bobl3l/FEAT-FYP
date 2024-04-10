import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../components/navbar.dart';
import '../database/auth.dart';
import '../database/database.dart';
import '../homescreen.dart';
import '../components/alert.dart';

class WorkoutDescription extends StatefulWidget {
  String name;
  String image;
  String des;
  String lvl;
  String cat;
  String duration;
  String frquency;
  String equipment;
  String id;

  WorkoutDescription(
      {required this.name,
      required this.image,
      required this.des,
      required this.cat,
      required this.lvl,
      required this.duration,
      required this.frquency,
      required this.equipment,
      required this.id});
  @override
  _WorkoutDescriptionState createState() => _WorkoutDescriptionState();
}

class _WorkoutDescriptionState extends State<WorkoutDescription> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
        child: Stack(
          children: [
            Image.network(
              widget.image,
              fit: BoxFit.cover,
              opacity: AlwaysStoppedAnimation(0.65),
              height: size.height,
            ),
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0.7, 1.5),
                  colors: [Color(0x000047FF), Color(0xFF0065FF)],
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  height: size.height * 0.55,
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(width: 3, color: Colors.white)),
                  child: Column(
                    children: [
                      Container(
                        width: size.width * 0.75,
                        height: size.height * 0.15,
                        color: primaryDarkColor,
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.name,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lalezar(
                                  color: Colors.white,
                                  fontSize: size.width * 0.06,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              widget.des,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lalezar(
                                  color: Colors.white,
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Duration:',
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.duration + ' weeks',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  'Fitness Level:',
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.lvl,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  'Category:',
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.cat,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Frequency:',
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.frquency + ' days/ week',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  'Equipments:',
                                  style: GoogleFonts.inter(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.equipment,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      FilledButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  MaterialStateProperty.all(primaryDarkColor),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: size.width * 0.07,
                                      vertical: size.width * 0.06))),
                          onPressed: () async {
                            String uid = await Auth().getUID();
                            await update("users", uid, 'workout',
                                db.collection("workouts").doc(widget.id));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                            AlertPopUp(context, 'success',
                                "You have successfully chosen your workout..");
                          },
                          child: Text(
                            'Choose this workout',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: size.width * 0.04,
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.03,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
