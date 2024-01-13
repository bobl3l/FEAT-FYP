import 'package:flutter/material.dart';
import 'package:feat/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class mealCard extends StatefulWidget {
  @override
  _mealCardState createState() => _mealCardState();
}

class _mealCardState extends State<mealCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          width: size.width * 0.3,
          height: size.height * 0.25,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0x33FEA12A), Color(0xFFFEA12A)],
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
                color: Color(0x82FEA32E),
                blurRadius: 10,
                offset: Offset(3, 6),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Curry Chicken',
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: size.width * 0.055),
              ),
              SizedBox(
                height: size.height * 0.002,
              ),
              Text(
                '100g Protein\n50g carbs\n30g fats\n',
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: size.width * 0.03),
              ),
              Row(children: [
                Text(
                  '520',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: size.width * 0.05),
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
        ),
        Image.asset(
          'assets/stew.png',
          height: size.height * 0.08,
          fit: BoxFit.contain,
        )
      ],
    );
  }
}
