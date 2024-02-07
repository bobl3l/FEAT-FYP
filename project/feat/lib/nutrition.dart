import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'components/dietcard.dart';
import 'components/customcard.dart';

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
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          CustomCard(type: 'nutrition'),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Certified Diet Plans:',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold, fontSize: size.width * 0.07),
              ),
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
                color: Colors.greenAccent.shade400,
                diet: 'Low Carb Diet',
                description:
                    'Classic low carb, low fat diet with high protein\nChicken breast and fruits',
                img: 'assets/avocado.png',
              )
            ],
          )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
