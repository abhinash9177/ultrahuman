import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ultrahuman/const/custom_paint.dart';
import 'package:ultrahuman/const/space_box.dart';

const gridColor = Color.fromARGB(255, 78, 77, 77);
const titleColor = Color(0xffFFFFFF);
const fashionColor = Color(0xffe15665);
const artColor = Color(0xff63e7e5);
const boxingColor = Color(0xff83dea7);
const entertainmentColor = Colors.white70;
const offRoadColor = Color(0xFFFFF59D);

class RadarGraphPage extends StatefulWidget {
  const RadarGraphPage({Key? key}) : super(key: key);

  @override
  _RadarGraphPageState createState() => _RadarGraphPageState();
}

class _RadarGraphPageState extends State<RadarGraphPage>
    with SingleTickerProviderStateMixin {
  double _percent = 0;

  late Animation<double> _oneAnimation;
  late AnimationController _animController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _oneAnimation = Tween(begin: 0.0, end: 0.2).animate(_animController)
      ..addListener(() {
        setState(() {
          _percent = _oneAnimation.value;
        });
      });
    _animController.forward();
  }

  //end of animation
  int selectedDataSetIndex = -1;
  double angleValue = 0;
  bool relativeAngleMode = false;
  List<Color> long = [const Color(0xffCE36BC), const Color(0xff382086)];
  List<Color> ahletic = [const Color(0xffE88A45), const Color(0xff803019)];
  List<Color> focus = [const Color(0xff54B5E6), const Color(0xff121145)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xffFFFFFF),
          ),
        ),
        backgroundColor: const Color(0xff000000),
        title: const Text(
          'Mon, jun 20',
          style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //const Text('Title configuration'),
                  // Row(
                  //   children: [
                  //     const Text('Angle'),
                  //     Slider(
                  //       value: angleValue,
                  //       min: 0,
                  //       max: 360,
                  //       onChanged: (double value) =>
                  //           setState(() => angleValue = value),
                  //     ),
                  //     Checkbox(
                  //       value: relativeAngleMode,
                  //       onChanged: (v) => setState(() => relativeAngleMode = v!),
                  //     ),
                  //     const Text('Relative'),
                  //   ],
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       selectedDataSetIndex = -1;
                  //     });
                  //   },
                  //   child: Text(
                  //     'Categories'.toUpperCase(),
                  //     style: const TextStyle(
                  //       color: titleColor,
                  //       fontSize: 32,
                  //       fontWeight: FontWeight.w300,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 4),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: rawDataSets()
                  //       .asMap()
                  //       .map((index, value) {
                  //         final isSelected = index == selectedDataSetIndex;
                  //         return MapEntry(
                  //           index,
                  //           GestureDetector(
                  //             onTap: () {
                  //               setState(() {
                  //                 selectedDataSetIndex = index;
                  //               });
                  //             },
                  //             child: AnimatedContainer(
                  //               duration: const Duration(milliseconds: 300),
                  //               margin: const EdgeInsets.symmetric(vertical: 2),
                  //               height: 26,
                  //               decoration: BoxDecoration(
                  //                 color: isSelected
                  //                     ? gridColor.withOpacity(0.5)
                  //                     : Colors.transparent,
                  //                 borderRadius: BorderRadius.circular(46),
                  //               ),
                  //               padding: const EdgeInsets.symmetric(
                  //                   vertical: 4.0, horizontal: 6),
                  //               child: Row(
                  //                 mainAxisSize: MainAxisSize.min,
                  //                 children: [
                  //                   AnimatedContainer(
                  //                     duration: const Duration(milliseconds: 400),
                  //                     curve: Curves.easeInToLinear,
                  //                     padding: EdgeInsets.all(isSelected ? 8 : 6),
                  //                     decoration: BoxDecoration(
                  //                       color: value.color,
                  //                       shape: BoxShape.circle,
                  //                     ),
                  //                   ),
                  //                   const SizedBox(width: 8),
                  //                   AnimatedDefaultTextStyle(
                  //                     duration: const Duration(milliseconds: 300),
                  //                     curve: Curves.easeInToLinear,
                  //                     style: TextStyle(
                  //                       color: isSelected ? value.color : gridColor,
                  //                     ),
                  //                     child: Text(value.title),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       })
                  //       .values
                  //       .toList(),
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Metabolic Vectors ',
                        style:
                            TextStyle(color: Color(0xff5B5959), fontSize: 16),
                      ),
                      SvgPicture.asset(
                        'assets/vectors/infoShade.svg',
                        color: const Color(0xff676767),
                      )
                    ],
                  ),
                  addHeight(30),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child: RadarChart(
                      RadarChartData(
                        radarTouchData: RadarTouchData(
                            touchCallback: (FlTouchEvent event, response) {
                          if (!event.isInterestedForInteractions) {
                            setState(() {
                              selectedDataSetIndex = -1;
                            });
                            return;
                          }
                          setState(() {
                            selectedDataSetIndex =
                                response?.touchedSpot?.touchedDataSetIndex ??
                                    -1;
                          });
                        }),
                        dataSets: showingDataSets(),
                        radarBackgroundColor: Colors.transparent,
                        borderData: FlBorderData(show: false),
                        radarBorderData:
                            const BorderSide(color: Colors.transparent),
                        titlePositionPercentageOffset: 0.2,
                        titleTextStyle:
                            const TextStyle(color: titleColor, fontSize: 16),
                        getTitle: (index, angle) {
                          final usedAngle = relativeAngleMode
                              ? angle + angleValue
                              : angleValue;

                          switch (index) {
                            case 0:
                              return RadarChartTitle(
                                text: 'Longevity',
                                angle: usedAngle,
                              );
                            case 2:
                              return RadarChartTitle(
                                text: 'Focus',
                                angle: usedAngle,
                              );
                            case 1:
                              return RadarChartTitle(
                                  text: 'Athletic', angle: usedAngle);
                            default:
                              return const RadarChartTitle(text: '');
                          }
                        },
                        tickCount: 1,
                        ticksTextStyle: const TextStyle(
                            color: Colors.transparent, fontSize: 10),
                        tickBorderData:
                            const BorderSide(color: Colors.transparent),
                        gridBorderData:
                            const BorderSide(color: gridColor, width: 2),
                      ),
                      swapAnimationDuration: const Duration(milliseconds: 400),
                    ),
                  ),
                  //end of graph
                  infoBoxGradient('Longevity', long),
                  addHeight(16),
                  infoBoxGradient('Athetic', ahletic),
                  addHeight(16),
                  infoBoxGradient('Focus', focus),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoBoxGradient(String name, List<Color> color) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: color)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              color: Color(0xffFFFFFF), fontSize: 14),
                        ),
                        addWidth(8),
                        SvgPicture.asset('assets/vectors/infoShade.svg')
                      ],
                    ),
                    addHeight(20),
                    Stack(
                      children: [
                        Transform.rotate(
                          angle: 6.92,
                          child: CustomPaint(
                            size: const Size(100, 80),
                            painter: ArcIndicator(
                                percent: _percent,
                                width: 12,
                                lineColor: const Color(0xffFFFFFF),
                                bgColor: const Color(0xff000000)),
                          ),
                        ),
                        const Positioned(
                          bottom: 25,
                          left: 40,
                          child: Text(
                            '5',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ), //end of column

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Circadian factor',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.bold),
                    ),
                    addHeight(10),
                    const Text(
                      'Circadian factor',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.bold),
                    ),
                    addHeight(10),
                    const Text(
                      'Circadian factor',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      '99%',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                    Text(
                      '0%',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                    Text(
                      '0%',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      var index = entry.key;
      var rawDataSet = entry.value;

      final isSelected = index == selectedDataSetIndex
          ? true
          : selectedDataSetIndex == -1
              ? true
              : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor:
            isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'Fashion',
        color: gridColor,
        values: [
          300,
          300,
          300,
        ],
      ),
      RawDataSet(
        title: 'Art & Tech',
        color: gridColor,
        values: [
          250,
          250,
          250,
        ],
      ),
      RawDataSet(
        title: 'Entertainment',
        color: gridColor,
        values: [
          200,
          200,
          200,
        ],
      ),
      RawDataSet(
        title: 'Off-road Vehicle',
        color: gridColor,
        values: [
          150,
          150,
          150,
        ],
      ),
      RawDataSet(
        title: 'Boxing',
        color: gridColor,
        values: [
          100,
          100,
          100,
        ],
      ),
      RawDataSet(
        title: 'Boxing',
        color: const Color(0xffCA33B9),
        values: [
          150,
          300,
          0,
        ],
      ),
    ];
  }
}

class RawDataSet {
  final String title;
  final Color color;
  final List<double> values;

  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });
}
