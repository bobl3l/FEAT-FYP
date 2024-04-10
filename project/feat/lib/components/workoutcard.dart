import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:feat/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feat/workout/workoutdes.dart';

class WorkoutCard extends StatefulWidget {
  String name;
  String image;
  String des;
  String lvl;
  String cat;
  String duration;
  String frquency;
  String equipment;
  String id;

  String rating;
  WorkoutCard(
      {required this.name,
      required this.image,
      required this.des,
      required this.cat,
      required this.lvl,
      required this.duration,
      required this.frquency,
      required this.equipment,
      required this.rating,
      required this.id});
  @override
  _WorkoutCardState createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WorkoutDescription(
                          name: widget.name,
                          image: widget.image,
                          des: widget.des,
                          cat: widget.cat,
                          lvl: widget.lvl,
                          duration: widget.duration,
                          frquency: widget.frquency,
                          equipment: widget.equipment,
                          id: widget.id,
                        )),
              );
            },
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.22,
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(30)),
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.cover),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(30)),
                  child: Container(
                    height: size.height * 0.22,
                    width: size.width * 0.75,
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.22,
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color.fromARGB(162, 74, 131, 255),
                        Color(0x939FBCF9)
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.name,
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.3,
                            child: Row(
                              children: [
                                Container(
                                  width: size.width * 0.1,
                                  height: size.width * 0.1,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.calendar_today_rounded,
                                    size: size.width * 0.06,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.duration,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.06),
                                    ),
                                    Text(
                                      'weeks',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: size.width * 0.035),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width * 0.3,
                            child: Row(
                              children: [
                                Container(
                                  width: size.width * 0.1,
                                  height: size.width * 0.1,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.star_rate_rounded,
                                    size: size.width * 0.06,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.rating,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.06),
                                    ),
                                    Text(
                                      'Rating',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: size.width * 0.035),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
