import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ultrahuman/athentication/login_page.dart';
import 'package:ultrahuman/const/space_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nav();
  }

  nav() async {
    await Future.delayed(const Duration(seconds: 2));
    logoAction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset('assets/vectors/logo.svg'),
            ),
            addHeight(8),
            Center(
              child: Text(
                'Ultrahuman:Metabolic fitness',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            addHeight(8),
            Center(
              child: Text(
                'Track your metabolism',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      )),
    );
  }

  logoAction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Loginpage()),
    );
  }
}
