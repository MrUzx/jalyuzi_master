import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/circle_progress_bar.dart';
import 'package:jalyuzi/view/login_page.dart';
import 'package:jalyuzi/view/signup_view.dart';
import 'package:jalyuzi/view/splash_page.dart';

class OnboardingPage extends StatefulWidget {
  final List<Map<String, String>> introductionList = [
    {
      'description':
          'Nutq kamchiligiga ega bolalarni maktabga tayyorlash fanidan o`quv qo`llanma',
      'image': 'assets/onboarding1.png',
    },
    {
      'description':
          'Qo‘llanma orqali nutq nuqsoniga ega bolalarni maktabga tayyorlashning nazariy asoslarini o‘rganish mumkin',
      'image': 'assets/onboarding2.png',
    },
    {
      'description':
          'Dasturda har bir mavzu uchun alohida bo‘limlar mavjud. Bo‘limda foydalanuvchilar fanni mustaqil o‘rganishlari uchun barcha resurslar joylangan',
      'image': 'assets/onboarding3.png',
    },
  ];

  final Color? foregroundColor;

  final Function? onTapSkipButton;

  OnboardingPage({this.foregroundColor, this.onTapSkipButton});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.introductionList.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingContent(
                description: widget.introductionList[index]['description']!,
                image: widget.introductionList[index]['image']!,
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SizedBox(height: 20),
                _customProgress(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _customProgress() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          child: CircleProgressBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.deepPurpleAccent,
            value: ((_currentPage + 1) * 1.0 / widget.introductionList.length),
          ),
        ),
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurpleAccent,
          ),
          child: IconButton(
            onPressed: () {
              if (_currentPage == widget.introductionList.length - 1) {
                // HomePage ga o'tis
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                  (Route<dynamic> route) => false,
                );
              } else {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            iconSize: 15,
          ),
        )
      ],
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String description, image;

  OnboardingContent({
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: double.infinity,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
