import 'package:flutter/material.dart';
import 'package:feat/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feat/dietdes.dart';

class DietCard extends StatefulWidget {
  String diet;
  String description;
  String img;
  Color color;
  DietCard(
      {required this.diet,
      required this.description,
      required this.img,
      required this.color});

  @override
  State<StatefulWidget> createState() => _DietCardState();
}

@override
_DietCardState createState() => _DietCardState();

class _DietCardState extends State<DietCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DietDescription()),
          );
        },
        child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            height: size.height * 0.215,
            width: size.width * 0.9,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.diet,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: size.width * 0.6,
                      child: Text(widget.description,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: size.width * 0.04,
                          ))),
                  Container(
                    width: size.width * 0.25,
                    child: Image.asset(
                      widget.img,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              )
            ])));
  }
}
