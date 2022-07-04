import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ultrahuman/const/space_box.dart';
import 'package:ultrahuman/repo/widget_repo.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedTab = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child:
            Column(children: [Expanded(child: tabs[selectedTab]), bottomRow()]),
      )),
    );
  }

  Widget bottomRow() {
    return Container(
      color: const Color(0xff161616),
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          addWidth(20),
          GestureDetector(
            onTap: () {
              selectedTab = 0;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/vectors/calender.svg'),
                addHeight(3),
                const Text(
                  'For You',
                  style: TextStyle(color: Color(0xffCAC2B6), fontSize: 12),
                )
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              selectedTab = 1;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 24, child: Image.asset('assets/images/meta4x.png')),
                addHeight(3),
                const Text(
                  'Metabolism',
                  style: TextStyle(color: Color(0xffCAC2B6), fontSize: 12),
                )
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              selectedTab = 2;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/vectors/discover.svg'),
                addHeight(3),
                const Text(
                  'Discover',
                  style: TextStyle(color: Color(0xffCAC2B6), fontSize: 12),
                )
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              selectedTab = 3;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/vectors/profile.svg'),
                addHeight(3),
                const Text(
                  'Profile',
                  style: TextStyle(color: Color(0xffCAC2B6), fontSize: 12),
                )
              ],
            ),
          ),
          addWidth(20),
        ],
      ),
    );
  }
}
