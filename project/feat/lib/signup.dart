import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'configuration.dart';
import 'database/auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.95,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: size.width * 0.08,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Start your fitness journey now...')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.4,
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            controller: email,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.email_outlined),
                                labelText: 'Email',
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          TextFormField(
                            controller: password,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.lock_outline_rounded),
                                labelText: 'Password',
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                icon: Icon(Icons.lock_outline_rounded),
                                labelText: 'Confirm Password',
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: FilledButton.tonal(
                                onPressed: () async {
                                  Auth().signup(
                                      email: email.text,
                                      password: password.text);
                                  Auth().signin(
                                      email: email.text,
                                      password: password.text);
                                  setState(() {});
                                  if (Auth().currentUser != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Configuration()),
                                    );
                                  }
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
                                            horizontal: size.width * 0.23,
                                            vertical: size.width * 0.04))),
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
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
