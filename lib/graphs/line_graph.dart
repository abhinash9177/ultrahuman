import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineGraphWidget extends StatefulWidget {
  const LineGraphWidget({Key? key}) : super(key: key);

  @override
  State<LineGraphWidget> createState() => _LineGraphWidgetState();
}

class _LineGraphWidgetState extends State<LineGraphWidget> {
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 14,
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.bold,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '';
        break;
      case 1:
        text = '9:00pm';
        break;
      case 3:
        text = '9:15pm';
        break;
      case 5:
        text = '9:30pm';
        break;
      case 7:
        text = '10:35pm';
        break;
      case 9:
        text = '11:00pm';
        break;
      case 11:
        text = '11:15pm';
        break;

      default:
        return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 14,
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.bold,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '10';
        break;
      case 10:
        text = '20';
        break;
      case 20:
        text = '30';
        break;
      case 30:
        text = '40';
        break;
      case 40:
        text = '50';
        break;

      default:
        return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  //colors
  final List<Color> gradient = const [
    Color(0xffA0F104),
    Color(0xffDD6A3D),
    Color(0xffC3D662),
    Color(0xffFF5B00),
    Color(0xff39EB60),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 500,
      child: LineChart(LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 60,
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    reservedSize: 30,
                    getTitlesWidget: bottomTitleWidgets)),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
              // interval: 1,
              // reservedSize: 30,
              // getTitlesWidget: leftTitleWidgets
            )),
            rightTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
            topTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
          ),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 30),
                FlSpot(2.6, 20),
                FlSpot(4.9, 55),
                FlSpot(6.8, 25),
                FlSpot(8, 40),
                FlSpot(9.5, 37),
                FlSpot(11, 34),
              ],
              dotData: FlDotData(show: false),
              isCurved: true,
              gradient: LinearGradient(colors: gradient),
              barWidth: 5,
            )
          ])),
    );
  }
}
