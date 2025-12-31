import 'package:flutter/material.dart';
import 'package:vkstore/controllers/auth_controller.dart';
import 'package:vkstore/utils/app_textstyle.dart';
import 'package:get/get.dart';
import 'package:vkstore/view/widget/signin_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingItem> _items = [
    OnboardingItem(
      image: 'assets/images/intro.png',
      title: 'Discover Latest Trends',
      description:
          'Explore the newest fashion trends and find your unique style',
    ),
    OnboardingItem(
      image: 'assets/images/intro1.png',
      title: 'Premium Quality Products',
      description: 'Shop Premium Quality products from top brands wordwide',
    ),
    OnboardingItem(
      image: 'assets/images/intro2.png',
      title: 'Easy & Secure Shopping',
      description: 'Simple and secure shopping experiencs at your fingertips',
    ),
  ];

  // handle get started button press

  void _handleGetStarted() {
    final AuthController authController = Get.find<AuthController>();
    authController.setFirstTimeDone();
    Get.off(() => SigninScreen());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  SizedBox(height: 40),
                  Text(
                    _items[index].title,
                    textAlign: TextAlign.center,
                    style: AppTextstyle.withColor(
                      AppTextstyle.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      _items[index].description,
                      textAlign: TextAlign.center,
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodyLarge,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: _currentIndex == index ? 24 : 8,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? Theme.of(context).primaryColor
                        : isDark
                        ? Colors.grey[700]
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _handleGetStarted(),
                  child: Text(
                    "Skip",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentIndex < _items.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _handleGetStarted();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _currentIndex < _items.length - 1 ? "Next" : "Get Started",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
