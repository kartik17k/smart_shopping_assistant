import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:smart_shopping_assistant/Screens/home.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = const TextStyle(
      color: Colors.white,
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
    );

    final TextStyle descriptionStyle = TextStyle(
      color: Colors.white.withOpacity(0.9),
      fontSize: 16.0,
      height: 1.5,
    );

    final BoxDecoration imageContainerDecoration = BoxDecoration(
      color: Colors.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(0, 4),
          blurRadius: 15.0,
        ),
      ],
    );

    final LinearGradient overlayGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        const Color(0xFF113F64).withOpacity(0.5),
      ],
    );

    return IntroSlider(
      slides: [
        Slide(
          title: "Welcome to Smart Grocery Assistant",
          description:
              "Organize your shopping lists efficiently and save time!",
          pathImage: "assets/images/tutorial1.png",
          backgroundColor: const Color(0xFF113F64),
          styleTitle: titleStyle,
          styleDescription: descriptionStyle,
          marginDescription: const EdgeInsets.symmetric(horizontal: 24.0),
          centerWidget: Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: imageContainerDecoration,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/tutorial1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: overlayGradient,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Slide(
          title: "Track Your Budget",
          description:
              "Plan your shopping trips and track spending in real-time.",
          pathImage: "assets/images/tutorial2.png",
          backgroundColor: const Color(0xFF113F64),
          styleTitle: titleStyle,
          styleDescription: descriptionStyle,
          marginDescription: const EdgeInsets.symmetric(horizontal: 24.0),
          centerWidget: Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: imageContainerDecoration,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/tutorial2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: overlayGradient,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Slide(
          title: "Insights and Suggestions",
          description:
              "Get personalized suggestions and insights to make smarter purchases.",
          pathImage: "assets/images/tutorial3.png",
          backgroundColor: const Color(0xFF113F64),
          styleTitle: titleStyle,
          styleDescription: descriptionStyle,
          marginDescription: const EdgeInsets.symmetric(horizontal: 24.0),
          centerWidget: Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: imageContainerDecoration,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/tutorial3.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: overlayGradient,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      onDonePress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      showSkipBtn: true,
      showNextBtn: true,
      skipButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.1)),
      ),
      nextButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.1)),
      ),
      doneButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.1)),
      ),
      onSkipPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      colorDot: Colors.white.withOpacity(0.5),
      colorActiveDot: Colors.white,
      sizeDot: 8.0,
      renderNextBtn: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.1),
        ),
        child: const Icon(Icons.navigate_next, color: Colors.white, size: 28),
      ),
      renderSkipBtn: const Text(
        'SKIP',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
      renderDoneBtn: const Text(
        'GET STARTED',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
