import 'package:flutter/material.dart';
import 'package:feat/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Chart extends StatefulWidget {
  List weight;
  List date;
  Chart({super.key, required this.date, required this.weight});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<_Weighttracker> data = [];

  bool showAvg = false;

  @override
  void initState() {
    for (var i = 0; i < widget.weight.length; i++) {
      var date = widget.date[i].toDate();
      data.add(_Weighttracker(
          DateFormat.MMMd().format(date), double.parse(widget.weight[i])));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryXAxis: CategoryAxis(
          axisLine: AxisLine(width: 1),
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          minimum: double.parse(widget.weight.last) - 2,
          maximum: double.parse(widget.weight.first) + 2,
          axisLine: AxisLine(width: 1),
          majorGridLines: MajorGridLines(width: 0),
        ),
        title: ChartTitle(
            text: 'weight  tracker',
            textStyle:
                GoogleFonts.lalezar(fontWeight: FontWeight.bold, fontSize: 24)),
        series: <CartesianSeries<_Weighttracker, String>>[
          SplineAreaSeries(
            dataSource: data,
            name: 'weight',
            splineType: SplineType.cardinal,
            borderDrawMode: BorderDrawMode.top,
            borderColor: Colors.blue,
            borderWidth: 2,
            cardinalSplineTension: 0.7,
            gradient: LinearGradient(colors: <Color>[
              Colors.white,
              primaryLightColor,
              Colors.blue.shade400
            ], transform: GradientRotation(2)),
            xValueMapper: (_Weighttracker weights, _) => weights.year,
            yValueMapper: (_Weighttracker weights, _) => weights.weights,
          )
        ]);
  }
}

class _Weighttracker {
  _Weighttracker(this.year, this.weights);

  final String year;
  final double weights;
}
