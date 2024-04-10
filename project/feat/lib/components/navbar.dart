import 'package:feat/database/user.dart';
import 'package:flutter/material.dart';
import 'package:feat/constants.dart';
import 'package:feat/challenges.dart';
import 'package:feat/workout/workoutlist.dart';
import 'package:feat/diet/dietlist.dart';
import 'package:feat/profile.dart';
import 'package:feat/homescreen.dart';

import '../diet/yourdiet.dart';
import '../workout/yourworkout.dart';

List menu = ["Challenge", "Fitness", "", "Nutrition", "Profile"];

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      height: size.height * 0.1,
      color: primaryLightColor,
      padding: EdgeInsets.all(size.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavButton(index: 0),
          NavButton(index: 1),
          SizedBox(
            width: size.width * 0.16,
          ),
          NavButton(index: 3),
          NavButton(index: 4),
        ],
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      padding: EdgeInsets.all(12),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: primaryLightColor),
      child: Container(
        padding: EdgeInsets.all(1),
        height: size.height * 0.13,
        decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
        child: IconButton(
          icon: Icon(Icons.home_rounded),
          iconSize: size.width * 0.075,
          color: primaryDarkColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
    );
  }
}

class NavButton extends StatefulWidget {
  int index;
  NavButton({required this.index});
  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FilledButton(
        style: ButtonStyle(
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: size.width * 0.03)),
            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            foregroundColor: MaterialStatePropertyAll(primaryDarkColor)),
        onPressed: () async {
          user = await getDetails();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => widget.index == 0
                  ? ChallengePage()
                  : (widget.index == 1 && user!.workout == null)
                      ? WorkoutList()
                      : (widget.index == 1 && user!.workout != null)
                          ? YourWorkout()
                          : (widget.index == 3 && user!.diet == null)
                              ? NutritionPage()
                              : (widget.index == 3 && user!.diet != null)
                                  ? YourDiet()
                                  : ProfilePage()));
        },
        child: Column(
          children: [
            Icon(
              widget.index == 0
                  ? Icons.emoji_events
                  : widget.index == 1
                      ? Icons.fitness_center
                      : widget.index == 3
                          ? Icons.restaurant
                          : widget.index == 4
                              ? Icons.account_box
                              : Icons.account_box,
              size: size.width * 0.07,
            ),
            Text(
              menu[widget.index],
              style: TextStyle(fontSize: 12),
            )
          ],
        ));
  }
}
