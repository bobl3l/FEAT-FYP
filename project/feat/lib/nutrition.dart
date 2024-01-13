import 'package:feat/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'homescreen.dart';
import 'components/dietcard.dart';

class NutritionPage extends StatefulWidget {
  @override
  _NutritionPageState createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(25))),
              height: size.height * 0.18,
              width: size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'You must be here for the first time.\nLet\'s get started with  choosing a nutrition plan.',
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
                              fontSize: size.width * 0.03),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                DietCard(
                  color: primaryFillColor,
                  diet: 'Mediterranean Diet',
                  description:
                      'Seafood & veggies\nLow fats, High protein &\nhigh fiber',
                  img: 'assets/fish.png',
                ),
                DietCard(
                  color: Colors.redAccent,
                  diet: 'Keto Diet',
                  description:
                      'High protein and high fats\ndiet, great for athletes',
                  img: 'assets/meat.png',
                ),
                DietCard(
                  color: Colors.greenAccent,
                  diet: 'Low Carb Diet',
                  description:
                      'Classic low carb, low fat diet with high protein\nChicken breast and fruits',
                  img: 'assets/avocado.png',
                )
              ],
            )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: size.height * 0.1,
        padding: EdgeInsets.all(20),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: primaryLightColor),
        child: Container(
          padding: EdgeInsets.all(1),
          height: size.height * 0.13,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: primaryColor),
          child: IconButton(
            icon: Icon(Icons.home_rounded),
            iconSize: size.width * 0.07,
            color: primaryDarkColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: navBar(),
    );
  }
}
