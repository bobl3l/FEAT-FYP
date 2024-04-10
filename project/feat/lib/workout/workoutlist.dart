import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../components/navbar.dart';
import '../components/workoutcard.dart';
import '../components/customcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WorkoutList extends StatefulWidget {
  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  List<String> levels = ["Beginner", "Intermediate", "Advanced"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomCard(type: 'workout'),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 8),
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              (levels[index] == "Beginner")
                                  ? 'For Beginners'
                                  : (levels[index] == "Intermediate")
                                      ? 'Intermediate Programs'
                                      : 'Advanced Programs',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )),
                      Container(
                        height: size.height * 0.25,
                        width: size.width,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                            vertical: size.height * 0.02),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("workouts")
                                .where("Level", isEqualTo: levels[index])
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final snap = snapshot.data!.docs;
                                return ListView.builder(
                                    itemCount: snap.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return WorkoutCard(
                                        name: snap[index]['name'],
                                        image: snap[index]['image'],
                                        des: snap[index]['description'],
                                        cat: snap[index]['Category'],
                                        lvl: snap[index]['Level'],
                                        duration: snap[index]['duration'],
                                        frquency: snap[index]['Frquency'],
                                        equipment: snap[index]['Equipment'],
                                        rating: snap[index]['rating'],
                                        id: snap[index]['id'],
                                      );
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
                                        indicatorType:
                                            Indicator.lineScalePulseOutRapid,
                                        colors: [primaryColor]));
                              }
                            }),
                      ),
                    ],
                  );
                }),
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
