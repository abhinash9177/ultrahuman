import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ultrahuman/const/space_box.dart';
import 'package:ultrahuman/graphs/line_graph.dart';
import 'package:ultrahuman/graphs/radar_graph.dart';
import 'package:ultrahuman/meta_score.dart';
import 'package:ultrahuman/repo/calender_repo.dart';

class Metabolism extends StatefulWidget {
  const Metabolism({Key? key}) : super(key: key);

  @override
  State<Metabolism> createState() => _MetabolismState();
}

class _MetabolismState extends State<Metabolism> {
  late ScrollController _scrollOne, _scrollTwo;
  int selectedCal = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollOne = ScrollController();
    _scrollTwo = ScrollController();
    _scrollOne.addListener(() {
      _scrollTwo.animateTo(_scrollOne.offset,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollOne.dispose();
    _scrollTwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            topCalender(),
            addHeight(30),
            metabolicScore(),
            addHeight(30),
            bloodGlucose(),
            addHeight(30),
            cgm(),
            addHeight(30),
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xff3D462B).withOpacity(0.1),
                    const Color(0xff3D462B).withOpacity(0.3),
                    const Color(0xff3D462B).withOpacity(0.4),
                    const Color(0xff725749).withOpacity(0.3),
                    const Color(0xff725749).withOpacity(0.4),
                    const Color(0xff725749).withOpacity(0.4),
                    const Color(0xff725749).withOpacity(0.5),
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcOver,
              child: SizedBox(
                height: 220,
                child: Stack(
                  children: [
                    Positioned(
                      left: 8,
                      bottom: 20,
                      child: SizedBox(
                        width: 30,
                        height: 220,
                        child: ListView.builder(
                            controller: _scrollTwo,
                            reverse: true,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  ((index + 1) * 10).toString(),
                                  style: const TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }),
                      ),
                    ),
                    SingleChildScrollView(
                        controller: _scrollOne,
                        scrollDirection: Axis.horizontal,
                        child: const SizedBox(
                            height: 220, width: 650, child: LineGraphWidget())),
                  ],
                ),
              ),
            ),
            addHeight(50),
            metaVectors(),
            addHeight(24),
            const Text(
              'TIMELINE',
              style: TextStyle(fontSize: 15, color: Color(0xffFFFFFF)),
            ),
            addHeight(16),
            controlDay('assets/vectors/greenright.svg',
                '10:00 PM Good metabolic control today', ''),
            addHeight(16),
            controlDay(
                'assets/vectors/rederror.svg',
                '9:29 PM Hyperglycemic event detected',
                'Your glucose (146) rose above the max target of (110 mg/dL).'),
            addHeight(16),
            controlDay(
                'assets/vectors/greenright.svg',
                '5:00 PM Nice and stable',
                'You\'ve maintained stable glucose levels so far.'),
            addHeight(16),
            controlDay(
                'assets/vectors/rederror.svg',
                '9:29 PM Hyperglycemic event detected',
                'Your glucose (146) rose above the max target of (110 mg/dL).'),
          ]),
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            shape: const CircleBorder(),
            backgroundColor: const Color(0xff000000),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/floatingPlus.png',
                height: 100,
              ),
            ),
          ),
          addWidth(20),
          FloatingActionButton(
            heroTag: "btn2",
            shape: const CircleBorder(),
            backgroundColor: const Color(0xff000000),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/floatingNext.png',
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget metaVectors() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RadarGraphPage()),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Color(0xff1C1C1C)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/vectors/eclips.svg'),
              addWidth(8),
              const Text(
                'Your Metabolic Vectors',
                style: TextStyle(fontSize: 14, color: Color(0xffFFFFFF)),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff6D6F6C),
              ),
              addWidth(8)
            ],
          ),
        ),
      ),
    );
  }
// time1

  Widget controlDay(String url, String name, String sub) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xff1C1C1C)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(url),
                addWidth(8),
                Text(
                  name,
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xffFFFFFF)),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xff6D6F6C),
                ),
                addWidth(8)
              ],
            ),
            sub == ''
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addHeight(6),
                      Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Text(
                          sub,
                          style: const TextStyle(
                              color: Color(0xff959796), fontSize: 14),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Widget cgm() {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff1C1C1C),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/vectors/cgm.svg'),
            addWidth(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Calibrate your CGM',
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 14),
                  ),
                  addHeight(2),
                  const Text(
                    'Your avg. baseline glucose seems high. If this doesn\'t match how you feel, you can calibrate your CGM',
                    maxLines: 5,
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 14),
                  ),
                  addHeight(6),
                  const Text(
                    'Not Now',
                    style: TextStyle(color: Color(0xff80827F), fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//blood gucose
  Widget bloodGlucose() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Blood Glucose 09:34 am',
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                ),
                addWidth(16),
                const Spacer(),
                SvgPicture.asset('assets/vectors/bloodglucose.svg'),
              ],
            ),
            Row(
              children: [
                const Text(
                  '101',
                  style: TextStyle(
                      fontSize: 34,
                      color: Color(0xff46FE46),
                      fontWeight: FontWeight.bold),
                ),
                addWidth(4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/vectors/topwhite.svg'),
                    const Text(
                      'mg/dL',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

//metabolic score
  Widget metabolicScore() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MetabolicScore()),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xff0D0D0D),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Metabolic score',
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                  ),
                  addWidth(16),
                  SvgPicture.asset('assets/vectors/info.svg'),
                  const Spacer(),
                  SvgPicture.asset('assets/vectors/arrow.svg'),
                ],
              ),
              Row(
                children: [
                  const Text(
                    '79',
                    style: TextStyle(
                        fontSize: 34,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.bold),
                  ),
                  addWidth(4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/vectors/topgreen.svg'),
                      const Text(
                        '+1 Compared to previous day',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff46FE46),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//top row calender
  Widget topCalender() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                width: 40,
                child: Column(
                  children: [
                    Text(
                      calender[index],
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.bold),
                    ),
                    addHeight(2),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCal = index;
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: selectedCal == index
                                  ? const Color(0xffFFFFFF)
                                  : Colors.transparent,
                              style: BorderStyle.solid,
                            ),
                            color: Color(0xff212121),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                            child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xffFFFFFF)),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
