import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'configuration.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                child: Image.asset(
                  'assets/loginlogo.png',
                  fit: BoxFit.contain,
                  width: size.width * 0.75,
                )),
            Expanded(
                flex: 8,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.3,
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
                                  'Login',
                                  style: TextStyle(
                                      fontSize: size.width * 0.08,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Please sign in to continue')
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
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.account_box_outlined),
                                      labelText: 'Username',
                                      contentPadding: EdgeInsets.all(10)),
                                  onSaved: (String? value) {},
                                  validator: (String? value) {
                                    return (value != null &&
                                            value.contains('@'))
                                        ? 'Do not use the @ char.'
                                        : null;
                                  },
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.lock_outline_rounded),
                                      labelText: 'Password',
                                      contentPadding: EdgeInsets.all(10)),
                                  onSaved: (String? value) {},
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: FilledButton.tonal(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Configuration()),
                                        );
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
                                                  horizontal: size.width * 0.33,
                                                  vertical:
                                                      size.width * 0.04))),
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: size.width * 0.05,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'No Account? Sign up here.',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
