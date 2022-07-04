import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraphWidget extends StatefulWidget {
  const BarGraphWidget({Key? key}) : super(key: key);

  @override
  State<BarGraphWidget> createState() => _BarGraphWidgetState();
}

class _BarGraphWidgetState extends State<BarGraphWidget> {
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 14,
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.bold,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '9:00pm';
        break;
      case 1:
        text = '9:15pm';
        break;
      case 2:
        text = '9:30pm';
        break;
      case 3:
        text = '10:35pm';
        break;
      case 4:
        text = '11:00pm';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BarChart(BarChartData(
          backgroundColor: const Color(0xff000000),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          alignment: BarChartAlignment.center,
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    getTitlesWidget: bottomTitleWidgets,
                    reservedSize: 22,
                    interval: 1)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(
                  //color: const Color(0xffF9F808),
                  width: 25,
                  toY: 4,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffF1AF49), Color(0xffF9F808)]))
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(color: Colors.transparent, width: 25, toY: 5)
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(color: Colors.transparent, width: 25, toY: 5)
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(color: Colors.transparent, width: 25, toY: 5)
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(color: Colors.transparent, width: 25, toY: 5)
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(color: Colors.transparent, width: 25, toY: 5)
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(color: Colors.transparent, width: 25, toY: 5)
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(color: Colors.transparent, width: 25, toY: 5)
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(color: Colors.transparent, width: 25, toY: 5)
            ]),
          ])),
    );
  }
}
