import 'package:flutter/material.dart';
import 'package:feat/constants.dart';
import 'package:feat/challenges.dart';
import 'package:feat/workoutlist.dart';
import 'package:feat/dietlist.dart';
import 'package:feat/profile.dart';
import 'package:feat/homescreen.dart';

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
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menu.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return index == 2
              ? SizedBox(
                  width: size.width * 0.22,
                )
              : FilledButton(
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: size.width * 0.03)),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor:
                          MaterialStatePropertyAll(primaryDarkColor)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => index == 0
                            ? ChallengePage()
                            : index == 1
                                ? WorkoutList()
                                : index == 3
                                    ? NutritionPage()
                                    : ProfilePage()));
                  },
                  child: Column(
                    children: [
                      Icon(
                        index == 0
                            ? Icons.emoji_events
                            : index == 1
                                ? Icons.fitness_center
                                : index == 3
                                    ? Icons.restaurant
                                    : index == 4
                                        ? Icons.account_box
                                        : Icons.account_box,
                        size: size.width * 0.07,
                      ),
                      Text(
                        menu[index],
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ));
        },
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
