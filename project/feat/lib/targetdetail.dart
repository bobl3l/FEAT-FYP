import 'package:feat/components/alert.dart';
import 'package:feat/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'components/navbar.dart';

class TargetDetailPage extends StatefulWidget {
  @override
  _TargetDetailPageState createState() => _TargetDetailPageState();
}

class _TargetDetailPageState extends State<TargetDetailPage> {
  double cal = (double.parse(localdata!.cal) * 100) / user!.calories;
  double water = (double.parse(localdata!.water) * 100) / user!.water;
  double sleep = (double.parse(localdata!.sleep) * 100) / user!.sleep;
  double exercise = (double.parse(localdata!.exercise) * 100) / user!.exercise;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryCardColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      height: size.height * 0.14,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Calories',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: size.width * 0.042),
                              ),
                              Image.asset(
                                'assets/kcal.png',
                                fit: BoxFit.contain,
                                height: size.height * 0.035,
                              )
                            ],
                          ),
                          Text(
                            '${cal.toStringAsFixed(0)}%',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07),
                          ),
                          Container(
                            height: 10,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: cal / 100,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffA6FF98)),
                                backgroundColor: Color(0xff66A95C),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      height: size.height * 0.14,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Protein',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: size.width * 0.042),
                              ),
                              Image.asset(
                                'assets/protein.png',
                                fit: BoxFit.contain,
                                height: size.height * 0.035,
                              )
                            ],
                          ),
                          Text(
                            localdata!.protein + 'g',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07),
                          ),
                          Container(
                            height: 10,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: cal / 100,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffFF7E7E)),
                                backgroundColor: Color(0xffBA4141),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      height: size.height * 0.14,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Carbs',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: size.width * 0.042),
                              ),
                              Image.asset(
                                'assets/carbs.png',
                                fit: BoxFit.contain,
                                height: size.height * 0.035,
                              )
                            ],
                          ),
                          Text(
                            localdata!.carb + 'g',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07),
                          ),
                          Container(
                            height: 10,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: cal / 100,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xff98CEFF)),
                                backgroundColor: Color(0xff5C8DA9),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      height: size.height * 0.14,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fats',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: size.width * 0.042),
                              ),
                              Image.asset(
                                'assets/fats.png',
                                fit: BoxFit.contain,
                                height: size.height * 0.035,
                              )
                            ],
                          ),
                          Text(
                            localdata!.fats + 'g',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07),
                          ),
                          Container(
                            height: 10,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: cal / 100,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffFDFF98)),
                                backgroundColor: Color(0xff808241),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    updateLocal(context, 'water');
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: size.height * 0.14,
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Water',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: size.width * 0.042),
                            ),
                            Image.asset(
                              'assets/watercup.png',
                              fit: BoxFit.contain,
                              height: size.height * 0.035,
                            )
                          ],
                        ),
                        Text(
                          '${water.toStringAsFixed(1)}%',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.07),
                        ),
                        Container(
                          height: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: water / 100,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff98F9FF)),
                              backgroundColor: Color(0xff5CA4A9),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    updateLocal(context, "exercise");
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: size.height * 0.14,
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exercise',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: size.width * 0.042),
                            ),
                            Image.asset(
                              'assets/weights.png',
                              fit: BoxFit.contain,
                              height: size.height * 0.035,
                            )
                          ],
                        ),
                        Text(
                          '${exercise.toStringAsFixed(1)}%',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.07),
                        ),
                        Container(
                          height: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: exercise / 100,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff96A2A3)),
                              backgroundColor: Color(0xff4D5353),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    updateLocal(context, 'sleep');
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: size.height * 0.14,
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sleep',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: size.width * 0.042),
                            ),
                            Image.asset(
                              'assets/moon.png',
                              fit: BoxFit.contain,
                              height: size.height * 0.035,
                            )
                          ],
                        ),
                        Text(
                          '${sleep.toStringAsFixed(1)}%',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.07),
                        ),
                        Container(
                          height: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: (sleep / 100),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 255, 228, 152)),
                              backgroundColor:
                                  Color.fromARGB(255, 169, 142, 92),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}

void updateLocal(BuildContext context, String type) {
  TextEditingController update = TextEditingController();
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        textAlign: TextAlign.center,
        type == 'water'
            ? "Update water consumption"
            : type == "sleep"
                ? "Update sleeping hours"
                : "Update exercising hours",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        controller: update,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Back',
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () async {
            await localdata!.updatedata(type, update.text);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            AlertPopUp(context, "success", "Successfully updated.");
          },
          child: const Text('Confirm'),
        ),
      ],
    ),
  );
}
