import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ultrahuman/const/space_box.dart';
import 'package:ultrahuman/const/text_form_field.dart';
import 'package:ultrahuman/dash_board.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  int activePage = 2;
  final TextEditingController _mobile = TextEditingController();
  final _loginkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
          child: Form(
        key: _loginkey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CarouselSlider.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          sliderImages(itemIndex + 1),
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            activePage = index;
                          });
                        },
                        autoPlay: true,
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                        aspectRatio: 3.6 / 4,
                        initialPage: 2,
                      ),
                    ),
                  ),
                  indicators(),
                  addHeight(30),
                  SvgPicture.asset('assets/vectors/logo.svg'),
                  addHeight(8),
                  Text(
                    'LOGIN TO CONNECT',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  addHeight(23),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: MyTextFormField(
                      contoller: _mobile,
                      label: 'Phone number',
                      hint: ' Enter your phone number',
                      error: 'Please enter phone number',
                    ),
                  ),
                  addHeight(8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: _continue,
                      child: Container(
                        height: 48,
                        decoration: const BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        child: const Center(
                          child: Text(
                            'CONTINUE',
                            style: TextStyle(
                                color: Color(0xffFF8346),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addHeight(23),
                  Text(
                    'OR',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  addHeight(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/vectors/google.svg'),
                      addWidth(40),
                      SvgPicture.asset('assets/vectors/facebook.svg'),
                      addWidth(40),
                      SvgPicture.asset('assets/vectors/email.svg')
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget indicators() => SizedBox(
      height: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    height: 2,
                    width: 50,
                    color: activePage >= index
                        ? const Color(0xff777777)
                        : const Color(0xffFFFFFF),
                  ),
                );
              }),
        ],
      ));

  Widget sliderImages(int itemIndex) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.99),
            Colors.black.withOpacity(0.2),
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcOver,
      child: Image.asset(
        'assets/images/img$itemIndex.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  _continue() {
    if (_loginkey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    }
  }
}
