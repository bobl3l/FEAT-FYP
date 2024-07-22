import 'package:feat/components/achievement.dart';
import 'package:feat/database/auth.dart';
import 'package:feat/database/user.dart';
import 'package:feat/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'components/chart.dart';
import 'components/alert.dart';
import 'database/database.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List menulist = [];
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: StreamBuilder(
            stream: db.collection('users').doc(user!.id).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final snap = snapshot.data!;
                final exp = int.parse(snap['exp']);
                return Center(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        height: size.height * 0.28,
                        width: size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/profile bg.png'),
                                colorFilter: ColorFilter.mode(
                                    primaryColor.withOpacity(0.25),
                                    BlendMode.dstATop),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.06,
                            ),
                            Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: primaryDarkColor, width: 4)),
                                    width: size.width * 0.22,
                                    height: size.width * 0.22,
                                    child: Image.asset(
                                      'assets/man1.png',
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Container(
                                  width: size.width * 0.5,
                                  height: size.height * 0.15,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        snap['name'],
                                        style: GoogleFonts.lalezar(
                                            fontSize: size.width * 0.07,
                                            fontWeight: FontWeight.bold,
                                            color: primaryDarkColor),
                                      ),
                                      Text(
                                          'Lv. ${(exp / 150).toStringAsFixed(0)}',
                                          style: GoogleFonts.lalezar(
                                              fontSize: size.width * 0.07,
                                              fontWeight: FontWeight.bold,
                                              color: primaryDarkColor)),
                                      Container(
                                        width: size.width * 0.6,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                                color: primaryLightColor,
                                                width: 4)),
                                        child: LinearPercentIndicator(
                                          barRadius: Radius.circular(16),
                                          padding: EdgeInsets.all(0),
                                          lineHeight: 16,
                                          progressColor: primaryColor,
                                          backgroundColor: primaryLightColor,
                                          percent: (exp % 150) / 100,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.26,
                        ),
                        padding: EdgeInsets.all(size.width * 0.05),
                        width: size.width,
                        height: size.height * 0.8,
                        decoration: BoxDecoration(
                            color: primaryCardColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Progress',
                              style: GoogleFonts.inter(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: primaryDarkColor),
                            ),
                            Container(
                              height: size.height * 0.3,
                              width: size.width * 0.9,
                              constraints: BoxConstraints(
                                  maxHeight: size.height * 0.3,
                                  maxWidth: size.width * 0.9),
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Chart(
                                date: snap['date'],
                                weight: snap['weight'],
                              ),
                            ),
                            Text(
                              'Your achievements',
                              style: GoogleFonts.inter(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: primaryDarkColor),
                            ),
                            Container(
                              width: size.width * 0.9,
                              constraints: BoxConstraints(
                                  maxHeight: size.height * 0.6,
                                  maxWidth: size.width * 0.9),
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: snap['achievements'] != null
                                  ? GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing:
                                                  size.width * 0.015,
                                              crossAxisSpacing:
                                                  size.width * 0.015,
                                              crossAxisCount: 3),
                                      itemCount: snap['achievements'].length,
                                      itemBuilder: (context, index) {
                                        return Achievement(
                                            des: snap['achievements'][index]
                                                ['des'],
                                            img: snap['achievements'][index]
                                                ['image'],
                                            title: snap['achievements'][index]
                                                ['title']);
                                      })
                                  : Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                          'You do not have any achievement yet, you can earn achievements through recording your healthy living activities and progresses.')),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.05,
                        right: size.width * 0.08,
                        child: Container(
                          width:
                              !isExpanded ? size.width * 0.2 : size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(28)),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              onExpansionChanged: (bool expanded) {
                                // Add this
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              title: isExpanded
                                  ? Text(
                                      "settings",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : SizedBox.shrink(),
                              trailing: Icon(Icons.settings_rounded),
                              children: [
                                TextButton(
                                    onPressed: () {
                                      editProfile(context);
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Edit profile'),
                                          Icon(Icons.construction_rounded)
                                        ])),
                                TextButton(
                                    onPressed: () async {
                                      await Auth().logout();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                      AlertPopUp(context, 'info',
                                          'You have logged out from your account.');
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'logout',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          Icon(
                                            Icons.logout_rounded,
                                            color: Colors.red,
                                          )
                                        ])),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}

void editProfile(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => EditProfile(),
  );
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool resetworkout = false;
  bool resetdiet = false;
  bool editing = true;
  bool newpw = false;

  TextEditingController name = TextEditingController(text: user!.name);
  TextEditingController password = TextEditingController(text: "********");
  TextEditingController calories =
      TextEditingController(text: user!.calories.toString());
  TextEditingController exercise =
      TextEditingController(text: user!.exercise.toString());
  TextEditingController water =
      TextEditingController(text: user!.water.toString());
  TextEditingController sleep =
      TextEditingController(text: user!.sleep.toString());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: EdgeInsets.all(20),
      title: Text(
        textAlign: TextAlign.center,
        'Update your profile',
        style: GoogleFonts.lalezar(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          width: size.width * 0.75,
          height: size.height * 0.6,
          padding: EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      editing = !editing;
                    });
                  },
                  icon: editing
                      ? Icon(
                          Icons.edit_document,
                          color: Colors.grey.shade400,
                        )
                      : Icon(
                          Icons.check,
                          color: Colors.blueGrey,
                        )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Username',
                style: GoogleFonts.inter(
                    color: Colors.grey, fontSize: size.width * 0.04),
              ),
            ),
            TextField(
              controller: name,
              readOnly: editing,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(4),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey.shade200),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Password',
                style: GoogleFonts.inter(
                    color: Colors.grey, fontSize: size.width * 0.04),
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  newpw = true;
                });
              },
              controller: password,
              readOnly: editing,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(4),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey.shade200),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Calories',
                        style: GoogleFonts.inter(
                            color: Colors.grey, fontSize: size.width * 0.04),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.28,
                      child: TextField(
                        readOnly: editing,
                        controller: calories,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(4),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.grey.shade200),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Exericse',
                        style: GoogleFonts.inter(
                            color: Colors.grey, fontSize: size.width * 0.04),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.28,
                      child: TextField(
                        readOnly: editing,
                        controller: exercise,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(4),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.grey.shade200),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Water',
                        style: GoogleFonts.inter(
                            color: Colors.grey, fontSize: size.width * 0.04),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.28,
                      child: TextField(
                        readOnly: editing,
                        controller: water,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(4),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.grey.shade200),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Sleep',
                        style: GoogleFonts.inter(
                            color: Colors.grey, fontSize: size.width * 0.04),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.28,
                      child: TextField(
                        readOnly: editing,
                        controller: sleep,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(4),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.grey.shade200),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Reset plans',
                style: GoogleFonts.inter(
                    color: Colors.grey, fontSize: size.width * 0.04),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                          horizontal: size.width * 0.032,
                        )),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        )),
                        foregroundColor: MaterialStatePropertyAll(
                            resetworkout ? Colors.white : Colors.grey),
                        backgroundColor: MaterialStatePropertyAll(resetworkout
                            ? primaryDarkColor
                            : Colors.grey.shade200)),
                    onPressed: () {
                      setState(() {
                        resetworkout = !resetworkout;
                      });
                    },
                    child: Text('Reset workout')),
                FilledButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                          horizontal: size.width * 0.032,
                        )),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        )),
                        foregroundColor: MaterialStatePropertyAll(
                            resetworkout ? Colors.white : Colors.grey),
                        backgroundColor: MaterialStatePropertyAll(resetdiet
                            ? primaryDarkColor
                            : Colors.grey.shade200)),
                    onPressed: () {
                      setState(() {
                        resetdiet = !resetdiet;
                      });
                    },
                    child: Text('Reset diet plan')),
              ],
            )
          ]),
        ),
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
            String uid = await Auth().getUID();
            if (resetdiet) {
              await update("users", uid, 'diet', null);
            }
            if (resetworkout) {
              await update("users", uid, 'workout', null);
            }
            if (newpw) {
              await Auth().newpassword(password.text);
            }
            Map<String, dynamic> data = {
              "name": name.text,
              "calories": double.parse(calories.text),
              "water": double.parse(water.text),
              "sleep": double.parse(sleep.text),
              "exercise": double.parse(exercise.text)
            };
            await bulkupdate("users", uid, data);
            user = await getDetails();
            Navigator.pop(context);
            AlertPopUp(context, "success", "You have updated your profile");
          },
          child: const Text('Make changes'),
        ),
      ],
    );
  }
}
