import 'package:flutter/material.dart';
import 'package:feat/constants.dart';

class Achievement extends StatefulWidget {
  String img;
  String des;
  String title;
  Achievement({required this.des, required this.img, required this.title});
  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Tooltip(
      richMessage: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: widget.title + '\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: widget.des,
          ),
        ],
      ),
      child: Container(
        width: size.width * 0.22,
        height: size.width * 0.22,
        child: Center(
            child: Stack(
          children: [
            Center(
              child: Container(
                width: size.width * 0.2,
                height: size.width * 0.2,
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
              left: size.width * 0.055,
              top: size.width * 0.185,
              child: Container(
                width: size.width * 0.05,
                height: size.width * 0.05,
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
              left: size.width * 0.115,
              top: size.width * 0.205,
              child: Container(
                width: size.width * 0.05,
                height: size.width * 0.05,
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
              left: size.width * 0.175,
              top: size.width * 0.185,
              child: Container(
                width: size.width * 0.05,
                height: size.width * 0.05,
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
            Center(
                child: Image.network(
              widget.img,
              fit: BoxFit.contain,
              width: size.width * 0.07,
            )),
          ],
        )),
      ),
    );
  }
}
