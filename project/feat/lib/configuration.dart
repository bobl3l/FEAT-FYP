import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'database/user.dart';
import 'homescreen.dart';
import 'database/database.dart';
import 'localData.dart';
import 'components/alert.dart';

TextEditingController weight = TextEditingController(text: '--');
TextEditingController nameInput = TextEditingController();
String? name;
double w = 70;
double h = 170;
TextEditingController height = TextEditingController(text: '--');
List gender = <String>["Male", "Female", "Non-binary"];
String genderselect = "";
List fit = <String>["Loss Weight", "Build Muscle", "Endurance Training"];
String fitselect = "";
List diet = <String>[
  "Halal",
  "Vegetarian",
  "Gluten free",
  "Lactose free",
  "Pescatarian",
  "No restriction"
];
String dietselect = "";
List config = [
  config1(),
  config2(),
  config3(),
  config4(),
  config5(),
  config6(),
  config7()
];

class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  int steps = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          height: size.height,
          width: size.width,
          color: primaryColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: (name == null)
                  ? [
                      SizedBox(
                        height: size.height * 0.15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        height: size.height * 0.85,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.all(35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Let\'s get started with your name:',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.07),
                              ),
                              SizedBox(height: size.height * 0.05),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'What do you like to be called?'),
                                controller: nameInput,
                              ),
                              SizedBox(height: size.height * 0.05),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: size.width * 0.35,
                                  child: FilledButton.tonal(
                                    onPressed: () {
                                      setState(() {
                                        name = nameInput.text;
                                      });
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor),
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: size.width * 0.04,
                                                vertical: size.width * 0.04))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Continue',
                                          style: TextStyle(
                                              fontSize: size.width * 0.04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.navigate_next_rounded,
                                          size: size.width * 0.05,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]
                  : [
                      Padding(
                        padding: EdgeInsets.all(
                          size.width * 0.05,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 5,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                      color: (steps == 0)
                                          ? primaryFillColor
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                ),
                                Container(
                                  height: 5,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                      color: (steps == 1)
                                          ? primaryFillColor
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                ),
                                Container(
                                  height: 5,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                      color: (steps == 2)
                                          ? primaryFillColor
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                ),
                                Container(
                                  height: 5,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                      color: (steps == 3)
                                          ? primaryFillColor
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                ),
                                Container(
                                  height: 5,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                      color: (steps == 4)
                                          ? primaryFillColor
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                ),
                                Container(
                                  height: 5,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                      color: (steps == 5)
                                          ? primaryFillColor
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                ),
                                Container(
                                  height: 5,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                      color: (steps == 6)
                                          ? primaryFillColor
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                ),
                              ],
                            ),
                            Container(
                              child: config[steps],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (steps != 6)
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      'This will help us understand you better and provide personal health suggestions.',
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : SizedBox.shrink(),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              height: size.height * 0.15,
                              width: size.width,
                              child: Padding(
                                padding: EdgeInsets.all(35),
                                child: steps == 6
                                    ? FilledButton.tonal(
                                        onPressed: () async {
                                          await userSetup(
                                              name,
                                              w.toString(),
                                              h.toString(),
                                              genderselect,
                                              fitselect,
                                              dietselect);
                                          user = await getDetails();
                                          await resetLocalData();
                                          localdata = await getLocalData();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()),
                                          );
                                          AlertPopUp(context, "success",
                                              "Welcome to FEAT!");
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryColor),
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.width * 0.06,
                                                    vertical:
                                                        size.width * 0.04))),
                                        child: Text(
                                          'Start your journey now!',
                                          style: TextStyle(
                                              fontSize: size.width * 0.045,
                                              color: primaryDarkColor,
                                              fontWeight: FontWeight.bold),
                                        ))
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          steps < 1
                                              ? SizedBox.shrink()
                                              : TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      steps--;
                                                    });
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .navigate_before_rounded,
                                                        size: 24.0,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Back',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                          FilledButton.tonal(
                                            onPressed: () {
                                              setState(() {
                                                steps++;
                                              });
                                            },
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        primaryColor),
                                                padding: MaterialStatePropertyAll(
                                                    EdgeInsets.symmetric(
                                                        horizontal:
                                                            size.width * 0.04,
                                                        vertical: size.width * 0.04))),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Continue',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons.navigate_next_rounded,
                                                  size: size.width * 0.05,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            )
                          ],
                        ),
                      )
                    ])),
    );
  }
}

class config1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * 0.05,
      ),
      Text(
        'Before we start, we need to know some information about you.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.07,
            color: primaryDarkColor),
      ),
      SizedBox(
        height: size.height * 0.05,
      ),
      Image.asset(
        'assets/config.png',
        fit: BoxFit.contain,
        height: size.height * 0.38,
      ),
    ]);
  }
}

class config2 extends StatefulWidget {
  @override
  _Config2State createState() => _Config2State();
}

class _Config2State extends State<config2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * 0.05,
      ),
      Text(
        'What is your current weight?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.07,
            color: primaryDarkColor),
      ),
      SizedBox(
        height: size.height * 0.05,
      ),
      Container(
        height: size.height * 0.12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.08,
              width: size.width * 0.21,
              child: Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: weight,
                    style: TextStyle(
                      color: primaryDarkColor,
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      fillColor: primaryCardColor,
                      border: InputBorder.none,
                    ),
                  )),
            ),
            Text(
              ' kg',
              style: TextStyle(
                  color: primaryDarkColor,
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      Container(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: size.height * 0.06,
            trackShape: RoundedRectSliderTrackShape(),
            activeTrackColor: primaryDarkColor,
            inactiveTrackColor: primaryLightColor,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: size.width * 0.045,
              pressedElevation: 4.0,
            ),
            thumbColor: primaryColor,
            overlayColor: Colors.pink.withOpacity(0.2),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.black,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          child: Slider(
            min: 40.0,
            max: 140.0,
            value: w,
            divisions: 100,
            label: '${w.round()}',
            onChanged: (double o) {
              setState(() {
                w = o;
                weight.text = w.toString();
              });
            },
          ),
        ),
      )),
    ]);
  }
}

class config3 extends StatefulWidget {
  @override
  _Config3State createState() => _Config3State();
}

class _Config3State extends State<config3> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * 0.05,
      ),
      Text(
        'What is your current height?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.07,
            color: primaryDarkColor),
      ),
      SizedBox(
        height: size.height * 0.05,
      ),
      Container(
        height: size.height * 0.12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.08,
              width: size.width * 0.21,
              child: Align(
                  alignment: Alignment.center,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: height,
                    style: TextStyle(
                      color: primaryDarkColor,
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      fillColor: primaryCardColor,
                      border: InputBorder.none,
                    ),
                  )),
            ),
            Text(
              ' cm',
              style: TextStyle(
                  color: primaryDarkColor,
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      Container(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: size.height * 0.06,
            trackShape: RoundedRectSliderTrackShape(),
            activeTrackColor: primaryDarkColor,
            inactiveTrackColor: primaryLightColor,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: size.width * 0.045,
              pressedElevation: 4.0,
            ),
            thumbColor: primaryColor,
            overlayColor: Colors.pink.withOpacity(0.2),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.black,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          child: Slider(
            min: 140.0,
            max: 200.0,
            value: h,
            divisions: 60,
            label: '${h.round()}',
            onChanged: (double o) {
              setState(() {
                h = o;
                height.text = h.toString();
              });
            },
          ),
        ),
      )),
    ]);
  }
}

class config4 extends StatefulWidget {
  @override
  _Config4State createState() => _Config4State();
}

class _Config4State extends State<config4> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * 0.05,
      ),
      Text(
        'What is your gender?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.07,
            color: primaryDarkColor),
      ),
      SizedBox(
        height: size.height * 0.05,
      ),
      ListView.builder(
        itemCount: gender.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
              height: size.height * 0.065,
              width: size.width * 0.6,
              margin: EdgeInsets.all(12),
              child: FilledButton.tonal(
                onPressed: () {
                  setState(() {
                    genderselect = gender[index];
                  });
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(
                        genderselect == gender[index]
                            ? Colors.white.withOpacity(0.9)
                            : primaryLightColor),
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.width * 0.04))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      index == 0
                          ? Icons.male_rounded
                          : index == 1
                              ? Icons.female_rounded
                              : Icons.transgender_rounded,
                      size: size.width * 0.07,
                      color: primaryDarkColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      gender[index],
                      style: TextStyle(
                          color: primaryDarkColor,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ));
        },
      ),
    ]);
  }
}

class config5 extends StatefulWidget {
  @override
  _Config5State createState() => _Config5State();
}

class _Config5State extends State<config5> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * 0.05,
      ),
      Text(
        'What is your fitness goal?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.07,
            color: primaryDarkColor),
      ),
      SizedBox(
        height: size.height * 0.15,
      ),
      Container(
          height: size.height * 0.20,
          width: size.width,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: fit.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                  height: size.height * 0.13,
                  width: size.width * 0.3,
                  padding: EdgeInsets.all(12),
                  child: FilledButton.tonal(
                    onPressed: () {
                      setState(() {
                        fitselect = fit[index];
                      });
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor: MaterialStateProperty.all(
                            fitselect == fit[index]
                                ? Colors.white
                                : primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          index == 0
                              ? 'assets/weightloss-vector.png'
                              : index == 1
                                  ? 'assets/muscle-vector.png'
                                  : 'assets/running-vector.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.08,
                        ),
                        Text(
                          fit[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ));
            },
          )),
    ]);
  }
}

class config6 extends StatefulWidget {
  @override
  _Config6State createState() => _Config6State();
}

class _Config6State extends State<config6> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * 0.05,
      ),
      Text(
        'What is your dietary restriction?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.07,
            color: primaryDarkColor),
      ),
      SizedBox(
        height: size.height * 0.1,
      ),
      Container(
        height: size.height * 0.45,
        width: size.width,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: diet.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.13,
                  width: size.height * 0.12,
                  child: FilledButton.tonal(
                    onPressed: () {
                      setState(() {
                        dietselect = diet[index];
                      });
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor: MaterialStateProperty.all(
                            dietselect == diet[index]
                                ? Colors.white
                                : primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          index == 0
                              ? 'assets/halal.png'
                              : index == 1
                                  ? 'assets/vegan.png'
                                  : index == 2
                                      ? 'assets/glutenfree.png'
                                      : index == 3
                                          ? 'assets/lactosefree.png'
                                          : index == 4
                                              ? 'assets/Pescatarian.png'
                                              : 'assets/norestriction.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.06,
                        ),
                        Text(
                          diet[index],
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ));
            }),
      ),
    ]);
  }
}

class config7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * 0.32,
      ),
      Text(
        'Congratulations!\nWe are all set!',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.1,
            color: primaryDarkColor),
      ),
    ]);
  }
}
