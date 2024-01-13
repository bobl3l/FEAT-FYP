import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'homescreen.dart';

TextEditingController weight = TextEditingController(text: '--');
TextEditingController height = TextEditingController(text: '--');
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
      body: Container(
          height: size.height,
          width: size.width,
          color: primaryColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(
                    size.width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  color: Colors.white,
                  child: SizedBox(
                    height: size.height * 0.15,
                    width: size.width,
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: steps == 6
                          ? FilledButton.tonal(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryColor),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: size.width * 0.06,
                                          vertical: size.width * 0.04))),
                              child: Text(
                                'Start your journey now!',
                                style: TextStyle(
                                    fontSize: size.width * 0.045,
                                    color: primaryDarkColor,
                                    fontWeight: FontWeight.bold),
                              ))
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.navigate_before_rounded,
                                              size: 24.0,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Back',
                                              style: TextStyle(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.bold),
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
                                                  BorderRadius.circular(10))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor),
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.symmetric(
                                              horizontal: size.width * 0.06,
                                              vertical: size.width * 0.04))),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
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
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    ),
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
        height: size.height * 0.1,
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
        height: size.height * 0.4,
      ),
      SizedBox(
        height: size.height * 0.065,
      ),
      Text(
        'This will help us understand you better and provide personal health suggestions.',
        textAlign: TextAlign.center,
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
        height: size.height * 0.1,
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
                  child: TextField(
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
          decoration: BoxDecoration(
              color: primaryLightColor,
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: HorizontalPicker(
                initialPosition: InitialPosition.center,
                minValue: 50,
                maxValue: 120,
                divisions: 70,
                height: size.height * 0.2,
                backgroundColor: primaryLightColor,
                onChanged: (o) {
                  setState(() {
                    weight.text = o.toString();
                  });
                }),
          )),
      SizedBox(
        height: size.height * 0.15,
      ),
      Text(
        'This will help us understand you better and provide personal health suggestions.',
        textAlign: TextAlign.center,
      ),
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
        height: size.height * 0.1,
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
          decoration: BoxDecoration(
              color: primaryLightColor,
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: HorizontalPicker(
                initialPosition: InitialPosition.center,
                minValue: 140,
                maxValue: 200,
                divisions: 120,
                height: size.height * 0.2,
                backgroundColor: primaryLightColor,
                onChanged: (o) {
                  setState(() {
                    height.text = o.toString();
                  });
                }),
          )),
      SizedBox(
        height: size.height * 0.15,
      ),
      Text(
        'This will help us understand you better and provide personal health suggestions.',
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: size.height * 0.01,
      ),
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
        height: size.height * 0.1,
      ),
      Text(
        'What is your gender',
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
          height: size.height * 0.065,
          width: size.width * 0.8,
          child: FilledButton.tonal(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(primaryLightColor),
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                    horizontal: size.width * 0.02,
                    vertical: size.width * 0.04))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.male_rounded,
                  size: size.width * 0.07,
                  color: primaryDarkColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Male',
                  style: TextStyle(
                      color: primaryDarkColor,
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
      SizedBox(
        height: size.height * 0.02,
      ),
      Container(
          height: size.height * 0.065,
          width: size.width * 0.8,
          child: FilledButton.tonal(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(primaryLightColor),
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                    horizontal: size.width * 0.02,
                    vertical: size.width * 0.04))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.female_rounded,
                  size: size.width * 0.07,
                  color: primaryDarkColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Female',
                  style: TextStyle(
                      color: primaryDarkColor,
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
      SizedBox(
        height: size.height * 0.02,
      ),
      Container(
          height: size.height * 0.065,
          width: size.width * 0.8,
          child: FilledButton.tonal(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(primaryLightColor),
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                    horizontal: size.width * 0.02,
                    vertical: size.width * 0.04))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.transgender_rounded,
                  size: size.width * 0.07,
                  color: primaryDarkColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Non-Binary',
                  style: TextStyle(
                      color: primaryDarkColor,
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
      SizedBox(
        height: size.height * 0.3,
      ),
      Text(
        'This will help us understand you better and provide personal health suggestions.',
        textAlign: TextAlign.center,
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
        height: size.height * 0.1,
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
        height: size.height * 0.1,
      ),
      Container(
          height: size.height * 0.25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: size.height * 0.13,
                  width: size.height * 0.12,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/weightloss-vector.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.08,
                        ),
                        Text(
                          'Weight Loss',
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              Container(
                  height: size.height * 0.13,
                  width: size.height * 0.12,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/muscle-vector.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.08,
                        ),
                        Text(
                          'Build Muscle',
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              Container(
                  height: size.height * 0.13,
                  width: size.height * 0.12,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/running-vector.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.08,
                        ),
                        Text(
                          'Endurance',
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            ],
          )),
      SizedBox(
        height: size.height * 0.25,
      ),
      Text(
        'This will help us understand you better and provide personal health suggestions.',
        textAlign: TextAlign.center,
      ),
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
        height: size.height * 0.1,
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
          height: size.height * 0.17,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: size.height * 0.13,
                  width: size.height * 0.12,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/halal.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.08,
                        ),
                        Text(
                          'Halal',
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              Container(
                  height: size.height * 0.13,
                  width: size.height * 0.12,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/vegan.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.08,
                        ),
                        Text(
                          'Vegetarian',
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              Container(
                  height: size.height * 0.13,
                  width: size.height * 0.12,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/glutenfree.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.08,
                        ),
                        Text(
                          'Gluten Free',
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            ],
          )),
      Container(
          height: size.height * 0.17,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: size.height * 0.13,
                  width: size.height * 0.12,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/lactosefree.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.08,
                        ),
                        Text(
                          'Lactose Free',
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              Container(
                  height: size.height * 0.13,
                  width: size.height * 0.12,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/Pescatarian.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.08,
                        ),
                        Text(
                          'Pescatarian',
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              Container(
                  height: size.height * 0.13,
                  width: size.height * 0.12,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                        backgroundColor:
                            MaterialStateProperty.all(primaryLightColor),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.width * 0.04))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/norestriction.png',
                          fit: BoxFit.contain,
                          height: size.height * 0.08,
                        ),
                        Text(
                          'No restrictions',
                          style: TextStyle(
                              color: primaryFillColor,
                              fontSize: size.width * 0.025,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            ],
          )),
      SizedBox(
        height: size.height * 0.12,
      ),
      Text(
        'This will help us understand you better and provide personal health suggestions.',
        textAlign: TextAlign.center,
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
