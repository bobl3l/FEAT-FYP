import 'package:feat/constants.dart';
import 'package:feat/database/user.dart';
import 'package:feat/homescreen.dart';
import 'package:feat/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'database/auth.dart';
import 'localData.dart';
import 'package:cron/cron.dart';
import 'configuration.dart';

Future<void> main() async {
  var cron = new Cron();
  cron.schedule(new Schedule.parse('0 0 * * *'), () async {
    resetLocalData();
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String id = await Auth().getUID();
  if (id != 'nouser') {
    user = await getDetails();
  }

  if (await dataCheck()) {
    localdata = await getLocalData();
  } else {
    resetLocalData();
    localdata = await getLocalData();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FEAT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WelcomePage(
              page: HomePage(),
            );
          } else {
            return LoginPage();
          }
          return HomePage();
        },
      ),
    );
  }
}
