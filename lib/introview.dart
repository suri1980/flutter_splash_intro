import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:splash_intro/homescreen.dart';

class IntroView extends StatefulWidget {
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title: "SLIDE 1",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        pathImage: "assets/cake-slice.png",
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
    slides.add(
      new Slide(
          title: "SLIDE 2",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          pathImage: "assets/emoticon.png",
          backgroundColor: Colors.purpleAccent),
    );
    slides.add(
      new Slide(
        title: "SLIDE 3",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        pathImage: "assets/petri-dish.png",
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void onSkipPress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}
