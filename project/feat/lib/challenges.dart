import 'package:feat/components/alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'constants.dart';
import 'components/navbar.dart';
import 'leaderboard.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryCardColor,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Text('CHALLENGES',
              style: GoogleFonts.lalezar(
                  fontSize: size.width * 0.12,
                  fontWeight: FontWeight.bold,
                  color: primaryDarkColor)),
          Expanded(
            child: StreamBuilder(
                stream: db.collection("challenges").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!.docs;
                    return ListView.builder(
                        itemCount: snap.length,
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ChallengeCard(
                            name: snap[index]['name'],
                            img: snap[index]['image'],
                            users: snap[index]['users'],
                            usersinfo: db.collection("challenges/" +
                                snap[index]['id'] +
                                "/userlist"),
                            prize: snap[index]['prize'],
                            disclaimer: snap[index]['disclaimer'],
                          );
                        });
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
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeButton(),
      bottomNavigationBar: NavBar(),
    );
  }
}

class ChallengeCard extends StatefulWidget {
  String name;
  String img;
  dynamic usersinfo;
  List prize;
  List users;
  String disclaimer;
  ChallengeCard(
      {required this.img,
      required this.name,
      required this.disclaimer,
      required this.prize,
      required this.users,
      required this.usersinfo});

  @override
  _WorkoutCardState createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<ChallengeCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height * 0.01),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            child: InkWell(
                onTap: () {
                  for (String i in widget.users) {
                    if (i == user!.id) {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Leaderboard(
                                  img: widget.img,
                                  name: widget.name,
                                  prize: widget.prize,
                                  usersinfo: widget.usersinfo)));
                    } else {
                      showDisclaimer(
                          context,
                          Leaderboard(
                              img: widget.img,
                              name: widget.name,
                              prize: widget.prize,
                              usersinfo: widget.usersinfo),
                          widget.disclaimer);
                    }
                  }
                },
                child: Image.network(
                  widget.img,
                  fit: BoxFit.cover,
                  width: size.width * 0.9,
                )),
          )),
    );
  }
}
