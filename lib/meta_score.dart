import 'package:flutter/material.dart';
import 'package:ultrahuman/const/space_box.dart';
import 'package:ultrahuman/graphs/bar_graph.dart';

class MetabolicScore extends StatefulWidget {
  const MetabolicScore({Key? key}) : super(key: key);

  @override
  State<MetabolicScore> createState() => _MetabolicScoreState();
}

class _MetabolicScoreState extends State<MetabolicScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        backgroundColor: const Color(0xff000000),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 20,
              color: Color(0xffFFFFFF),
            )),
        title: const Text(
          'Metabolic Score',
          style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
        ),
      ),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView(children: [
            addHeight(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 18,
                    color: Color(0xff6D6F6C),
                  ),
                  Text(
                    '27 Jun - 3 jul',
                    style: TextStyle(color: Color(0xff939592), fontSize: 12),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                    color: Color(0xff6D6F6C),
                  )
                ],
              ),
            ),
            addHeight(30),
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Stack(
                    children: const [
                      SizedBox(height: 220, child: BarGraphWidget()),
                      Positioned(
                        left: 6,
                        child: Text(
                          '79',
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const Positioned(
                    top: 10,
                    child: Divider(
                      color: Color(0xff1E1E1E),
                      height: 5,
                      thickness: 4,
                    ),
                  ),
                  Positioned(
                      bottom: 8,
                      left: -10,
                      child: Container(
                          height: 30,
                          color: const Color(0xff000000),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              addHeight(8),
                              const Divider(
                                color: Color(0xff1E1E1E),
                                height: 5,
                                thickness: 4,
                              ),
                              daysDisplay(),
                            ],
                          ))),
                ],
              ),
            ),
            // addHeight(8),
            // const Divider(
            //   color: Color(0xff1E1E1E),
            //   height: 5,
            //   thickness: 4,
            // ),
            // daysDisplay(),
            addHeight(30),
            monday(),
            addHeight(16),
            variabilityScore(),
            addHeight(16),
            average(),
            addHeight(16),
            timeInTargetScore(),
          ]),
        ),
      )),
    );
  }

// variability score
  Widget variabilityScore() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xff1C1C1C)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Glucose Variability Score',
                  style: TextStyle(color: Color(0xff929493), fontSize: 18),
                ),
                Text(
                  '100',
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            addHeight(16),
            const LinearProgressIndicator(
                value: 1,
                color: Color(0xff494A4C),
                backgroundColor: Color(0xff494A4C),
                minHeight: 5,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFFFFFF))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  '+1 compared to last day',
                  style: TextStyle(fontSize: 12, color: Color(0xff7AF95E)),
                ),
              ],
            ),
            addHeight(16),
            Row(
              children: [
                const Text(
                  'Your glucose variability is ',
                  style: TextStyle(fontSize: 12, color: Color(0xff929493)),
                ),
                const Text(
                  ' 9 %.',
                  style: TextStyle(fontSize: 14, color: Color(0xffFBFDFA)),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Color(0xff6D6F6C),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

//avarage
  Widget average() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xff1C1C1C)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Glucose Variability Score',
                  style: TextStyle(color: Color(0xff929493), fontSize: 18),
                ),
                Text(
                  '70',
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            addHeight(16),
            const LinearProgressIndicator(
                value: 0.7,
                color: Color(0xff494A4C),
                backgroundColor: Color(0xff494A4C),
                minHeight: 5,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFFFFFF))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  '+1 compared to last day',
                  style: TextStyle(fontSize: 12, color: Color(0xff7E020C)),
                ),
              ],
            ),
            addHeight(16),
            Row(
              children: const [
                Text(
                  'Your average glucose is ',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff929493),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ' 107 mg/dL',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffFBFDFA),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            addHeight(16),
            Row(
              children: [
                const Text(
                  'Your estimated HbA1c is ',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff929493),
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  ' 5.4% ',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffFBFDFA),
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Learn More',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        color: Color(0xff929493),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Color(0xff6D6F6C),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // time score
  Widget timeInTargetScore() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xff1C1C1C)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Time in Target Score',
                  style: TextStyle(color: Color(0xff929493), fontSize: 18),
                ),
                Text(
                  '20',
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            addHeight(16),
            const LinearProgressIndicator(
                value: 0.2,
                color: Color(0xff494A4C),
                backgroundColor: Color(0xff494A4C),
                minHeight: 5,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFFFFFF))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  '+20 compared to last day',
                  style: TextStyle(fontSize: 12, color: Color(0xff7AF95E)),
                ),
              ],
            ),
            addHeight(16),
            Row(
              children: [
                const Text(
                  'Your % time in target range is ',
                  style: TextStyle(fontSize: 12, color: Color(0xff929493)),
                ),
                const Text(
                  ' 78 %.',
                  style: TextStyle(fontSize: 14, color: Color(0xffFBFDFA)),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Color(0xff6D6F6C),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget monday() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            '27 JUN',
            style: TextStyle(
                fontSize: 22,
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.bold),
          ),
          addWidth(8),
          const Text(
            'Monday',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xffA2A4A3),
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget daysDisplay() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Mon',
            style: TextStyle(fontSize: 12, color: Color(0xffA2A3A5)),
          ),
          Text(
            'Tue',
            style: TextStyle(fontSize: 12, color: Color(0xffA2A3A5)),
          ),
          Text(
            'Wed',
            style: TextStyle(fontSize: 12, color: Color(0xffA2A3A5)),
          ),
          Text(
            'Thu',
            style: TextStyle(fontSize: 12, color: Color(0xffA2A3A5)),
          ),
          Text(
            'Fri',
            style: TextStyle(fontSize: 12, color: Color(0xffA2A3A5)),
          ),
          Text(
            'Sat',
            style: TextStyle(fontSize: 12, color: Color(0xffA2A3A5)),
          ),
          Text(
            'Sun',
            style: TextStyle(fontSize: 12, color: Color(0xffA2A3A5)),
          )
        ],
      ),
    );
  }
}
