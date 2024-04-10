import 'package:feat/components/mealcard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../components/alert.dart';
import '../constants.dart';
import '../components/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class YourDiet extends StatefulWidget {
  @override
  _YourDietState createState() => _YourDietState();
}

class _YourDietState extends State<YourDiet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
          child: StreamBuilder(
              stream: user!.diet.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data! as DocumentSnapshot;
                  return NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          bottom: PreferredSize(
                            child: Container(),
                            preferredSize: Size(0, 20),
                          ),
                          pinned: false,
                          titleSpacing: 0,
                          automaticallyImplyLeading: false,
                          expandedHeight: size.height * 0.2,
                          flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                  child: Stack(children: [
                            Image.asset(
                              "assets/dietbg.jpg",
                              opacity: AlwaysStoppedAnimation(0.3),
                              fit: BoxFit.cover,
                              width: size.width,
                            ),
                            Container(
                              height: size.height * 0.2,
                              width: size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color.fromARGB(160, 52, 196, 72),
                                    Colors.transparent
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.05,
                                horizontal: 20,
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Your diet suggestions',
                                    style: GoogleFonts.inter(
                                        fontSize: size.width * 0.1,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(50),
                                  ),
                                ),
                              ),
                              bottom: -1,
                              left: 0,
                              right: 0,
                            ),
                          ]))),
                        ),
                      ];
                    },
                    body: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Container(
                                width: size.width,
                                height: size.height * 0.9,
                                color: Colors.white,
                                child: Padding(
                                    padding: EdgeInsets.all(size.width * 0.07),
                                    child: FutureBuilder(
                                      future: getList(snap["meals"]),
                                      builder: ((context, snapshot) {
                                        if (snapshot.hasData) {
                                          List meals = snapshot.data!;
                                          return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snap['name'],
                                                  style: GoogleFonts.inter(
                                                      fontSize:
                                                          size.width * 0.1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .lightGreen.shade900),
                                                ),
                                                Divider(),
                                                Text(
                                                  'Mains',
                                                  style: GoogleFonts.inter(
                                                      fontSize:
                                                          size.width * 0.06,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .lightGreen.shade900),
                                                ),
                                                Container(
                                                  height: size.height * 0.3,
                                                  width: size.width,
                                                  child: ListView.builder(
                                                      itemCount: meals.length,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        if (meals[index]
                                                                ['cat'] ==
                                                            'main') {
                                                          return InkWell(
                                                              onTap: () {
                                                                ShowRecipe(
                                                                    context,
                                                                    meals[index]
                                                                        ['cal'],
                                                                    meals[index]
                                                                        [
                                                                        'carbs'],
                                                                    meals[index]
                                                                        [
                                                                        'fats'],
                                                                    meals[index]
                                                                        [
                                                                        'ingredient'],
                                                                    meals[index]
                                                                        [
                                                                        'name'],
                                                                    meals[index]
                                                                        [
                                                                        'protein'],
                                                                    meals[index]
                                                                        [
                                                                        'direction'],
                                                                    meals[index]
                                                                        ['id']);
                                                              },
                                                              child: mealCard(
                                                                  id: meals[index]
                                                                      ['id'],
                                                                  use: 'recipe',
                                                                  cal: meals[index]
                                                                      ['cal'],
                                                                  carbs: meals[index]
                                                                      ['carbs'],
                                                                  cat: meals[index]
                                                                      ['cat'],
                                                                  direction:
                                                                      meals[index][
                                                                          'direction'],
                                                                  fats: meals[index]
                                                                      ['fats'],
                                                                  ingredient:
                                                                      meals[index][
                                                                          'ingredient'],
                                                                  name: meals[index]
                                                                      ['name'],
                                                                  preptime:
                                                                      meals[index][
                                                                          'preptime'],
                                                                  protein:
                                                                      meals[index]
                                                                          ['protein'],
                                                                  type: meals[index]['type']));
                                                        } else {
                                                          return SizedBox
                                                              .shrink();
                                                        }
                                                      })),
                                                ),
                                                Divider(),
                                                Text(
                                                  'Sides',
                                                  style: GoogleFonts.inter(
                                                      fontSize:
                                                          size.width * 0.06,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .lightGreen.shade900),
                                                ),
                                                Container(
                                                  height: size.height * 0.3,
                                                  width: size.width,
                                                  child: ListView.builder(
                                                      itemCount: meals.length,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        if (meals[index]
                                                                ['cat'] ==
                                                            'side') {
                                                          return InkWell(
                                                              onTap: () {
                                                                ShowRecipe(
                                                                    context,
                                                                    meals[index]
                                                                        ['cal'],
                                                                    meals[index]
                                                                        [
                                                                        'carbs'],
                                                                    meals[index]
                                                                        [
                                                                        'fats'],
                                                                    meals[index]
                                                                        [
                                                                        'ingredient'],
                                                                    meals[index]
                                                                        [
                                                                        'name'],
                                                                    meals[index]
                                                                        [
                                                                        'protein'],
                                                                    meals[index]
                                                                        [
                                                                        'direction'],
                                                                    meals[index]
                                                                        ['id']);
                                                              },
                                                              child: mealCard(
                                                                  id: meals[index]
                                                                      ['id'],
                                                                  use: 'recipe',
                                                                  cal: meals[index]
                                                                      ['cal'],
                                                                  carbs: meals[index]
                                                                      ['carbs'],
                                                                  cat: meals[index]
                                                                      ['cat'],
                                                                  direction:
                                                                      meals[index][
                                                                          'direction'],
                                                                  fats: meals[index]
                                                                      ['fats'],
                                                                  ingredient:
                                                                      meals[index][
                                                                          'ingredient'],
                                                                  name: meals[index]
                                                                      ['name'],
                                                                  preptime:
                                                                      meals[index][
                                                                          'preptime'],
                                                                  protein:
                                                                      meals[index]
                                                                          ['protein'],
                                                                  type: meals[index]['type']));
                                                        } else {
                                                          return SizedBox
                                                              .shrink();
                                                        }
                                                      })),
                                                ),
                                              ]);
                                        } else {
                                          return Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.height * 0.2,
                                                  bottom: size.height * 0.45,
                                                  left: size.width * 0.2,
                                                  right: size.width * 0.2),
                                              child: LoadingIndicator(
                                                  strokeWidth: 3,
                                                  indicatorType: Indicator
                                                      .lineScalePulseOutRapid,
                                                  colors: [primaryColor]));
                                        }
                                      }),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}

Future<List> getList(dynamic docArray) async {
  List docList = [];
  for (DocumentReference i in docArray) {
    await i.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        docList.add(data);
      },
    );
  }
  print(docList);
  return docList;
}
