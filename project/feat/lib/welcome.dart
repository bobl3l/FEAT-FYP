import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'login.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: primaryColor,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/login_dumbell.png',
                      fit: BoxFit.contain,
                      height: size.height * 0.13,
                    ),
                    Image.asset(
                      'assets/login_salad.png',
                      fit: BoxFit.contain,
                      height: size.height * 0.13,
                    )
                  ],
                )),
            Expanded(
                flex: 5,
                child: Image.asset(
                  'assets/login_yoga.png',
                  fit: BoxFit.contain,
                )),
            Expanded(
                flex: 3,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  color: Colors.white,
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to FEAT!',
                          style: GoogleFonts.lalezar(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.1),
                        ),
                        Text('Your path to healthy living begins now...\n\n'),
                        FilledButton.tonal(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
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
                                        horizontal: size.width * 0.1,
                                        vertical: size.width * 0.04))),
                            child: Text(
                              'Let\'s Go',
                              style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
