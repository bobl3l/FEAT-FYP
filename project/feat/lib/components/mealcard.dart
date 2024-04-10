import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:feat/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feat/components/alert.dart';

class mealCard extends StatefulWidget {
  String cal;
  String carbs;
  String protein;
  String fats;
  String cat;
  String direction;
  String ingredient;
  String name;
  String preptime;
  String type;
  String use;
  String id;
  mealCard(
      {required this.id,
      required this.use,
      required this.cal,
      required this.carbs,
      required this.cat,
      required this.direction,
      required this.fats,
      required this.ingredient,
      required this.name,
      required this.preptime,
      required this.protein,
      required this.type});
  @override
  _mealCardState createState() => _mealCardState();
}

class _mealCardState extends State<mealCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.3,
        width: size.width * 0.3,
        margin: EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: size.height * 0.05,
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: size.width * 0.3,
                  height: size.height * 0.215,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: widget.type == 'meat'
                          ? [
                              Colors.pink.withOpacity(0.05),
                              Colors.redAccent.withOpacity(0.6)
                            ]
                          : widget.type == 'veg'
                              ? [
                                  Colors.lightGreen.withOpacity(0.05),
                                  Colors.green.shade700.withOpacity(0.6)
                                ]
                              : [
                                  Colors.yellow.withOpacity(0.3),
                                  Colors.yellow.shade700.withOpacity(0.8)
                                ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: widget.type == 'meat'
                            ? Colors.pinkAccent.withOpacity(0.25)
                            : widget.type == 'veg'
                                ? Colors.green.shade400.withOpacity(0.45)
                                : Colors.yellow.shade600.withOpacity(0.35),
                        blurRadius: 10,
                        offset: Offset(3, 6),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: widget.use == 'recipe'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.name,
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: size.width * 0.045),
                            ),
                            SizedBox(
                              height: size.height * 0.002,
                            ),
                            Text(
                              'Prep Time:',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.035),
                            ),
                            Row(children: [
                              Text(
                                widget.preptime,
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: size.width * 0.06),
                              ),
                              Text(
                                ' mins',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.04),
                              )
                            ]),
                            Text(
                              'Calories:',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.035),
                            ),
                            Row(children: [
                              Text(
                                widget.cal,
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: size.width * 0.06),
                              ),
                              Text(
                                ' kcal',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.04),
                              )
                            ])
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.name,
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: size.width * 0.045),
                            ),
                            SizedBox(
                              height: size.height * 0.002,
                            ),
                            Text(
                              '${widget.preptime}g Protein\n${widget.carbs}g carbs\n${widget.fats}g fats',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.035),
                            ),
                            Row(children: [
                              Text(
                                widget.cal,
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: size.width * 0.065),
                              ),
                              Text(
                                ' kcal',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.04),
                              )
                            ])
                          ],
                        ),
                )),
            Image.asset(
              widget.type == 'meat'
                  ? 'assets/meat.png'
                  : widget.type == 'veg'
                      ? 'assets/salad.png'
                      : 'assets/bread.png',
              height: size.height * 0.12,
              fit: BoxFit.contain,
            )
          ],
        ));
  }
}
