import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BabyWeightData {
  final DateTime date;
  final double weight;

  BabyWeightData(this.date, this.weight);
}

class WeightChart extends StatefulWidget {
  final List<BabyWeightData> data;

  const WeightChart({Key? key, required this.data}) : super(key: key);

  @override
  _WeightChartState createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {
  late bool showGrid;
  late Color lineColor;

  @override
  void initState() {
    super.initState();
    loadChartPreferences();
  }

  Future<void> loadChartPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      showGrid = prefs.getBool('showGrid') ?? true; // Default value
      lineColor = Color(prefs.getInt('lineColor') ?? Colors.blue.value); // Default value
    });
  }

  Future<void> saveChartPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showGrid', showGrid);
    prefs.setInt('lineColor', lineColor.value);
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot> flSpots = widget.data.map((data) {
      return FlSpot(data.date.microsecondsSinceEpoch.toDouble(), data.weight);
    }).toList();

    return LineChart(
      LineChartData(
        gridData: FlGridData(show: showGrid),
        titlesData: FlTitlesData(

          leftTitles: AxisTitles(),
          topTitles: AxisTitles(),
          bottomTitles: AxisTitles()
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: flSpots,
            isCurved: true,
            color: Colors.black,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        minX: widget.data.first.date.microsecondsSinceEpoch.toDouble(),
        maxX: widget.data.last.date.microsecondsSinceEpoch.toDouble(),
        minY: widget.data.map((e) => e.weight).reduce((min, current) => min > current ? current : min),
        maxY: widget.data.map((e) => e.weight).reduce((max, current) => max < current ? current : max),
        lineTouchData: LineTouchData(enabled: true),
      ),
    );
  }
}
