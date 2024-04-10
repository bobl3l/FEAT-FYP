import 'package:feat/components/alert.dart';
import 'package:feat/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';
import 'database/user.dart';
import 'localData.dart';
import 'signup.dart';
import 'database/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
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
                                  controller: email,
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.account_box_outlined),
                                      labelText: 'Email',
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
                                  controller: password,
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.lock_outline_rounded),
                                      labelText: 'Password',
                                      contentPadding: EdgeInsets.all(10)),
                                  onSaved: (String? value) {},
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: FilledButton.tonal(
                                      onPressed: () async {
                                        String op = await Auth().signin(
                                            email: email.text,
                                            password: password.text);

                                        if (op == 'success') {
                                          user = await getDetails();
                                          localdata = await getLocalData();
                                          setState(() {});
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()),
                                          );
                                          AlertPopUp(context, 'success',
                                              'Welcome to FEAT!');
                                        } else {
                                          AlertPopUp(context, 'error',
                                              'Something went wrong, try again');
                                        }
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
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()),
                                    );
                                  },
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
