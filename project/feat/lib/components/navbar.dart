import 'package:flutter/material.dart';
import 'package:feat/constants.dart';
import 'package:feat/challenges.dart';
import 'package:feat/workout.dart';
import 'package:feat/nutrition.dart';
import 'package:feat/profile.dart';

class navBar extends StatefulWidget {
  @override
  _navBarState createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      height: size.height * 0.1,
      color: primaryLightColor,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButton(
                style: ButtonStyle(
                    maximumSize: MaterialStatePropertyAll(Size(100, 60)),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    foregroundColor:
                        MaterialStatePropertyAll(primaryDarkColor)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ChallengePage()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.emoji_events,
                      size: size.width * 0.07,
                    ),
                    Text(
                      'Challenges',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )),
            FilledButton(
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    foregroundColor:
                        MaterialStatePropertyAll(primaryDarkColor)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WorkoutPage()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.fitness_center,
                      size: size.width * 0.07,
                    ),
                    Text(
                      'Fitness',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )),
            SizedBox(
              width: size.width * 0.1,
            ),
            FilledButton(
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    foregroundColor:
                        MaterialStatePropertyAll(primaryDarkColor)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NutritionPage()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.restaurant,
                      size: size.width * 0.07,
                    ),
                    Text(
                      'Nutrition',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )),
            FilledButton(
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    foregroundColor:
                        MaterialStatePropertyAll(primaryDarkColor)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.account_box,
                      size: size.width * 0.07,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
