import 'package:flutter/material.dart';
import 'package:intropage/utils/Strings.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  static final String id = 'intro_page';
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentIndex = page;
              });
            },
            children: [
              makePage(
                image: 'assets/images/image_1.png',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                image: 'assets/images/image_2.png',
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
              makePage(
                image: 'assets/images/image_3.png',
                title: Strings.stepFourTitle,
                content: Strings.stepFourContent,
              ),
              makePage(
                image: 'assets/images/image_1.png',
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 270),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: _currentIndex == 3
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, HomePage.id);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 18),
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, content}) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.wifi_channel,
                      color: Colors.orange,
                      size: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          "S",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "s",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "uz",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Study better together',
                style: TextStyle(color: Colors.orange, fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              Center(
                  child: Text(title,
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 20),
              Center(
                  child: Text(
                content,
                style: TextStyle(color: Colors.orange, fontSize: 24),
                textAlign: TextAlign.center,
              )),
              SizedBox(height: 140),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange),
                child: Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.lightBlue[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Already have an account",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.orange),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[900]),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> _indicators = [];
    for (int i = 0; i < 4; i++) {
      if (_currentIndex == i) {
        _indicators.add(_indicator(true));
      } else {
        _indicators.add(_indicator(false));
      }
    }
    return _indicators;
  }
}
