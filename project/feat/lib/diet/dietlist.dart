import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../constants.dart';
import '../components/navbar.dart';
import '../components/dietcard.dart';
import '../components/customcard.dart';

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
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("diets")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final snap = snapshot.data!.docs;
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          itemCount: snap.length,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return DietCard(
                                diet: snap[index]['name'],
                                description: snap[index]['description'],
                                img: snap[index]['image'],
                                color: snap[index]['color'],
                                protein: snap[index]['protein'],
                                fat: snap[index]['fats'],
                                carb: snap[index]['carbs'],
                                cal: snap[index]['Cal'],
                                time: snap[index]['prep'],
                                id: snap[index]['id']);
                          });
                    } else {
                      return Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.2,
                              bottom: size.height * 0.45,
                              left: size.width * 0.2,
                              right: size.width * 0.2),
                          child: LoadingIndicator(
                              strokeWidth: 3,
                              indicatorType: Indicator.lineScalePulseOutRapid,
                              colors: [primaryColor]));
                    }
                  })),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
