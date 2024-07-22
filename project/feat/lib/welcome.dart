import 'package:feat/components/alert.dart';
import 'package:feat/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'login.dart';

class WelcomePage extends StatefulWidget {
  dynamic page;
  WelcomePage({required this.page});
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late final AnimationController _dumbell = AnimationController(
    duration: const Duration(milliseconds: 1200),
    vsync: this,
  );
  late final Animation<double> _animation1 = CurvedAnimation(
    parent: _dumbell,
    curve: Curves.elasticInOut,
  );
  late final AnimationController _salad = AnimationController(
    duration: const Duration(milliseconds: 1200),
    vsync: this,
  );
  late final Animation<double> _animation2 = CurvedAnimation(
    parent: _salad,
    curve: Curves.elasticInOut,
  );
  late final AnimationController _yoga = AnimationController(
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  );
  late final Animation<double> _animation3 = CurvedAnimation(
    parent: _yoga,
    curve: Curves.elasticOut,
  );
  late final AnimationController _box = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  );

  late final Animation<Offset> _animation4 = Tween<Offset>(
    begin: Offset(0, 1),
    end: Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _box,
    curve: Curves.elasticOut,
  ));
  @override
  void initState() {
    _dumbell.forward();
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      _salad.forward();
    });
    Future.delayed(Duration(milliseconds: 3500), () {
      _yoga.forward();
    });
    Future.delayed(Duration(seconds: 5), () {
      _box.forward();
    });
  }

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
                    ScaleTransition(
                      scale: _animation1,
                      child: Container(
                        height: size.height * 0.13,
                        child: Image.asset(
                          'assets/login_dumbell.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    ScaleTransition(
                      scale: _animation2,
                      child: Image.asset(
                        'assets/login_salad.png',
                        fit: BoxFit.contain,
                        height: size.height * 0.13,
                      ),
                    ),
                  ],
                )),
            ScaleTransition(
              scale: _animation3,
              child: Image.asset(
                'assets/login_yoga.png',
                height: size.height * 0.4,
                fit: BoxFit.contain,
              ),
            ),
            SlideTransition(
              position: _animation4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
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
                                builder: (context) => widget.page),
                          );
                          if (widget.page == HomePage()) {
                            AlertPopUp(context, "info", 'welcome back!');
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
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
            ),
          ],
        ),
      ),
    );
  }
}
