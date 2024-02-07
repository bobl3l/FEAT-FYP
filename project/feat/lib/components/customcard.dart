import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  String type;
  CustomCard({required this.type});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))),
      height: size.height * 0.185,
      width: size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'You must be here for the first time.\nLet\'s get started with  choosing a $type plan.',
            style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.048),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'customize your own >>',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                      decorationColor: Colors.white,
                      fontSize: size.width * 0.045),
                )),
          ),
        ],
      ),
    );
  }
}
