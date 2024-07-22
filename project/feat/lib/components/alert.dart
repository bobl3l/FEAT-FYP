import 'package:feat/constants.dart';
import 'package:feat/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../leaderboard.dart';

void AlertPopUp(BuildContext context, String type, String msg) {
  showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    context: context,
    pageBuilder: (context, anim1, anim2) {
      Future.delayed(Duration(milliseconds: 1800), () {
        Navigator.of(context).pop(); // Close the dialog
      });
      return NotifBox(
        type: type,
        msg: msg,
      );
    },
  );
}

class NotifBox extends StatefulWidget {
  late String type;
  late String msg;
  NotifBox({super.key, this.type = 'success', this.msg = 'Success!'});

  @override
  _NotifBoxState createState() => _NotifBoxState();
}

class _NotifBoxState extends State<NotifBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(0, -0.2),
    end: Offset(0, 0.05),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  ));

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            // constraints: BoxConstraints(
            //   minWidth: size.width,
            //   minHeight: 500,
            // ),
            width: size.width * 0.9,
            child: Text(
              widget.msg,
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: (widget.type == "success")
                  ? Colors.green
                  : (widget.type == "error")
                      ? Colors.redAccent
                      : primaryLightColor,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
    );
  }
}

class Recipe extends StatefulWidget {
  String cal;
  String carbs;
  String fats;
  String protein;
  String name;
  String recipe;
  String ingredient;
  String id;
  Recipe(
      {super.key,
      required this.id,
      required this.cal,
      required this.carbs,
      required this.fats,
      required this.ingredient,
      required this.name,
      required this.protein,
      required this.recipe});

  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late AnimationController _arrowcontroller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800), // Adjust the duration as needed
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(curve: Curves.easeOutBack, parent: _controller));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(8),
          backgroundColor: Colors.grey.shade200,
          surfaceTintColor: Colors.transparent,
          content: Container(
              color: Colors.grey.shade200,
              height: size.height * 0.8,
              width: size.width * 0.8,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Text(
                            widget.name,
                            style: GoogleFonts.inter(
                                fontSize: size.width * 0.08,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    Image.asset(
                                      'assets/protein.png',
                                      width: size.width * 0.08,
                                      fit: BoxFit.contain,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Protein',
                                          style: GoogleFonts.inter(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '${widget.protein} g',
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * 0.16,
                                    ),
                                    Image.asset(
                                      'assets/carbs.png',
                                      width: size.width * 0.08,
                                      fit: BoxFit.contain,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Carbs',
                                          style: GoogleFonts.inter(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '${widget.carbs} g',
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    Image.asset(
                                      'assets/fats.png',
                                      width: size.width * 0.08,
                                      fit: BoxFit.contain,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Fats',
                                          style: GoogleFonts.inter(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '${widget.fats} g',
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * 0.195,
                                    ),
                                    Image.asset(
                                      'assets/kcal.png',
                                      width: size.width * 0.08,
                                      fit: BoxFit.contain,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Calories",
                                          style: GoogleFonts.inter(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '${widget.cal} kcal',
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Recipe',
                              style: GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontSize: size.width * 0.08,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  'Ingredients',
                                  style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: [
                                  ListTile(
                                    title: Text(
                                      widget.ingredient.replaceAll('|', '\n'),
                                      style: GoogleFonts.inter(
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  'Directions',
                                  style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: [
                                  ListTile(
                                    title: Text(
                                      widget.recipe.replaceAll('|', '\n'),
                                      style: GoogleFonts.inter(
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FilledButton.tonal(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green.shade700)),
                      onPressed: () {
                        localdata?.addmeal(widget.id);
                        localdata?.updatedata('cal', widget.cal);
                        localdata?.updatedata('protein', widget.protein);
                        localdata?.updatedata('fats', widget.fats);
                        localdata?.updatedata('carb', widget.carbs);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                        AlertPopUp(context, 'success',
                            'You have successfully added this meal');
                      },
                      child: Text(
                        'Add this meal',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}

void ShowRecipe(BuildContext context, String cal, String carbs, String fats,
    String ingredient, String name, String protein, String recipe, String id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Recipe(
          id: id,
          cal: cal,
          carbs: carbs,
          fats: fats,
          ingredient: ingredient,
          name: name,
          protein: protein,
          recipe: recipe);
    },
  );
}

void showDisclaimer(
    BuildContext context, Leaderboard leaderboard, String disclaimer) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        textAlign: TextAlign.center,
        'Disclaimer',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
        disclaimer.replaceAll('\\n', '\n'),
        style: GoogleFonts.inter(fontSize: 12),
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
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => leaderboard),
            );
          },
          child: const Text('Agree & Continue'),
        ),
      ],
    ),
  );
}
