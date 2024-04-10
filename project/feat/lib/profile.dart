import 'package:feat/components/achievement.dart';
import 'package:feat/database/auth.dart';
import 'package:feat/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'homescreen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'components/chart.dart';
import 'components/alert.dart';

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
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: size.width * 0.015,
                                          crossAxisSpacing: size.width * 0.015,
                                          crossAxisCount: 3),
                                  itemCount: snap['achievements'].length,
                                  itemBuilder: (context, index) {
                                    return Achievement(
                                        des: snap['achievements'][index]['des'],
                                        img: snap['achievements'][index]
                                            ['image'],
                                        title: snap['achievements'][index]
                                            ['title']);
                                  }),
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
  List<String> list = <String>['Calories', 'Water', 'Exercise', 'Sleep'];
  String dropdownValue = list.first;

  Size size = MediaQuery.of(context).size;
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: EdgeInsets.all(8),
      title: Text(
        textAlign: TextAlign.center,
        'Update your profile',
        style: GoogleFonts.lalezar(fontWeight: FontWeight.bold),
      ),
      content: Container(
        width: size.width * 0.8,
        height: size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'name:',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold, fontSize: size.width * 0.05),
                ),
                SizedBox(
                  width: size.width * 0.5,
                  child: TextField(
                    cursorHeight: size.height * 0.03,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.

                    dropdownValue = value!;
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: size.width * 0.5,
                  child: TextField(
                    cursorHeight: size.height * 0.03,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            FilledButton(onPressed: () {}, child: Text('reset diet plan')),
            FilledButton(onPressed: () {}, child: Text('reset workout plan'))
          ],
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
          onPressed: () {},
          child: const Text('Make changes'),
        ),
      ],
    ),
  );
}
