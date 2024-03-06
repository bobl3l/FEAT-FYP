import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'components/workoutcard.dart';
import 'customize.dart';
import 'components/customcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomCard(type: 'workout'),
            // ListView.builder(
            //     padding: EdgeInsets.symmetric(vertical: 8),
            //     itemCount: levels.length,
            //     itemBuilder: (context, index) {
            //       return Column(
            //         children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "beginner",
                    // (levels[index] == "Beginner")
                    //     ? 'For Beginners'
                    //     : (levels[index] == "Intermediate")
                    //         ? 'Intermediate Programs'
                    //         : 'Advanced Programs',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            Container(
              height: size.height * 0.2,
              width: size.width,
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.02),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("workouts")
                      .where("Level", isEqualTo: "Beginner"
                          //levels[index]
                          )
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final snap = snapshot.data!.docs;
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 8),
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
                                frquency: snap[index]['Frequency'],
                                equipment: snap[index]['Equipment'],
                                rating: snap[index]['rating']);
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
            //     ],
            //   );
            // }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}
