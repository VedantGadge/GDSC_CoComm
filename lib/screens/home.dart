import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<String> languages = [
    'स्वागत है',
    'স্বাগতম', // Bangla
    'Welcome to',
    'स्वागत आहे',
    'خوش آمدید', // Urdu
    'ਸਵਾਗਤ ਹੈ', // Punjabi
    'வரவேற்கிறோம்', // Tamil
  ];
  int currentIndex = 0;
  Timer? timer;

  final ScrollController _scrollController = ScrollController();
  double _Position = -200; // Initial off-screen position
  double _aboutUsOpacity = 0.0;
  double _whyGDSCOpacity = 0.0;
  double _conceptGDSCOpacity = 0.0;
  double _TargetAudOpacity = 0.0;
  double _VisionOpacity = 0.0;
  double _StudyJamOpacity = 0.0;
  double _TechnicalOpacity = 0.0;
  double _OverallDOpacity = 0.0;
  double _WorkshopOpacity = 0.0;
  double _WhatWeDoOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);
    timer = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      setState(() {
        currentIndex = (currentIndex + 1) % languages.length;
      });
    });
    _scrollController.addListener(() {
      setState(() {
        _aboutUsOpacity =
            _scrollController.offset > 100 ? 1.0 : 0.0; // About Us fade-in
        if (_scrollController.offset > 200) {
          // Adjust threshold for Why GDSC
          _whyGDSCOpacity = 1.0; // Show Why GDSC
        } else {
          _whyGDSCOpacity = 0.0; // Hide Why GDSC
        }
        if (_scrollController.offset > 300) {
          // Adjust threshold for Concept of GDSC
          _conceptGDSCOpacity = 1.0;
        } else {
          _conceptGDSCOpacity = 0.0;
        }
        if (_scrollController.offset > 500) {
          // Adjust threshold for Target Audience
          _TargetAudOpacity = 1.0;
        } else {
          _TargetAudOpacity = 0.0;
        }
        if (_scrollController.offset > 900) {
          // Adjust threshold for Vision
          _VisionOpacity = 1.0;
        } else {
          _VisionOpacity = 0.0;
        }
        if (_scrollController.offset > 1200) {
          // Adjust threshold for StudyJam
          _StudyJamOpacity = 1.0;
        } else {
          _StudyJamOpacity = 0.0;
        }
        if (_scrollController.offset > 1500) {
          // Adjust threshold for Technical
          _TechnicalOpacity = 1.0;
        } else {
          _TechnicalOpacity = 0.0;
        }
        if (_scrollController.offset > 1800) {
          // Adjust threshold for OverallD
          _OverallDOpacity = 1.0;
        } else {
          _OverallDOpacity = 0.0;
        }
        if (_scrollController.offset > 2050) {
          // Adjust threshold for Workshop
          _WorkshopOpacity = 1.0;
        } else {
          _WorkshopOpacity = 0.0;
        }
        if (_scrollController.offset > 2200) {
          // Adjust threshold for What We do sec
          _WhatWeDoOpacity = 1.0;
        } else {
          _WhatWeDoOpacity = 0.0;
        }
      });
    });
  }

  void _scrollListener() {
    // Adjust the left position based on the scroll offset
    if (_scrollController.offset > 2500) {
      setState(() {
        // Change the value to adjust when the container should start appearing
        _Position = 30; // You can change this value for smooth entry
      });
    } else {
      setState(() {
        _Position = -200; // Move it off the screen when scrolled up
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const SizedBox(
                  height: 70,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'GDSC DJSCE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Home',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Our Team',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Events',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Gallery',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Contact Us',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ],
            ),
          ),
        ),
        //Appbar
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/images/GDSCLogo.jpg',
            scale: 8,
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),

        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: SizedBox(
              width: double.infinity,
              height: 3600,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //Welcome text
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 - 120,
                    child: Text(
                      languages[currentIndex],
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // GDSC Text with DJSCE
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 - 100,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'G',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                'D',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                'S',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                'C',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            "DJSCE",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Rotating words positioned beneath the main title
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 - 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: Duration.zero,
                        animatedTexts: [
                          RotateAnimatedText(
                            'Collaborate',
                            textStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            transitionHeight: 40,
                            duration: const Duration(milliseconds: 1300),
                          ),
                          RotateAnimatedText(
                            'Learn',
                            textStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            transitionHeight: 40,
                            duration: const Duration(milliseconds: 1300),
                          ),
                          RotateAnimatedText(
                            'Explore',
                            textStyle: const TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            transitionHeight: 40,
                            duration: const Duration(milliseconds: 1300),
                          ),
                          RotateAnimatedText(
                            'Create',
                            textStyle: const TextStyle(
                              color: Colors.amber,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            transitionHeight: 40,
                            duration: const Duration(milliseconds: 1300),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 20,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 20,
                        child: const Text(
                          "Meet and learn with other developers and build solutions for communities with Google technology.",
                          style: TextStyle(
                            fontFamily: 'Addington',
                            color: Colors.black54,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  // About section
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 250,
                    child: AnimatedOpacity(
                      opacity: _aboutUsOpacity,
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          const Text(
                            'About Us',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'neue',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 3,
                            width: 135,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.amber,
                                  Colors.green,
                                  Colors.blue,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Why GDSC section
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 350,
                    left: 15,
                    child: AnimatedOpacity(
                      opacity: _whyGDSCOpacity,
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        "Why GDSC? ✨",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 630,
                    left: 15,
                    child: AnimatedOpacity(
                      opacity: _conceptGDSCOpacity,
                      duration: const Duration(milliseconds: 700),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: SizedBox(
                          width: 370,
                          child: Text(
                            "GDSCs are university groups endorsed by Google, offering tech workshops and networking for students to learn about Google tech and collaborate on projects. Great for skill building and industry connections",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Concept of GDSC
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 600,
                    right: 35,
                    child: AnimatedOpacity(
                      opacity: _conceptGDSCOpacity,
                      duration: const Duration(milliseconds: 700),
                      child: const Text(
                        "🚀 Concept of GDSC",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 350,
                    left: 15,
                    child: AnimatedOpacity(
                      opacity: _whyGDSCOpacity,
                      duration: const Duration(milliseconds: 700),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Why GDSC?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: SizedBox(
                              width: 370,
                              child: Text(
                                "GDSCs are university groups endorsed by Google, offering tech workshops and networking for students to learn about Google tech and collaborate on projects. Great for skill building and industry connections",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Target Audience
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 850,
                    left: 15,
                    child: AnimatedOpacity(
                      opacity: _TargetAudOpacity,
                      duration: const Duration(milliseconds: 700),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Target Audience 👥",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: SizedBox(
                              width: 370,
                              child: Text(
                                "University students interested in DSA, web and app development etc, seeking to enhance their skills, collaborate on projects, and connect with a community passionate about Google technologies",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Vision section
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 1100,
                    child: AnimatedOpacity(
                      opacity: _VisionOpacity,
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          const Text(
                            'Vision',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'neue',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 3,
                            width: 90,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.amber,
                                  Colors.green,
                                  Colors.blue,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 1160,
                    child: AnimatedOpacity(
                      opacity: _VisionOpacity,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          child: const Text(
                            "GDSC DJCSE is inspired by the Google Developer's Family.Our goal is to learn, explore, innovate and create.And also UPGRADING OURSELVES!",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // GDSC Study Jam
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 1350,
                    child: SizedBox(
                      width: 350,
                      height: 200,
                      child: Stack(
                        children: [
                          // Image with dimming effect
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/GstudyJam.jpg',
                              fit: BoxFit.cover,
                              color: Colors.black
                                  .withOpacity(0.5), // Dim the image
                              colorBlendMode: BlendMode.darken,
                              width: 350,
                              height: 200,
                            ),
                          ),
                          // Heading text
                          const Positioned(
                            left: 80,
                            top: 10,
                            child: Text(
                              "GDSC Study Jam",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Description text (fades in)
                          Positioned(
                            top: 60,
                            left: 15,
                            child: AnimatedOpacity(
                              opacity: _StudyJamOpacity,
                              duration: const Duration(milliseconds: 500),
                              child: const Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 330,
                                  child: Text(
                                    "Participating in GDSC study jams unlocks the opportunity to access premium courses at no cost, allowing individuals to acquire valuable skills and knowledge without the financial barrier.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Technical
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 1600,
                    child: SizedBox(
                      width: 350,
                      height: 200, // Adjust height as needed
                      child: Stack(
                        children: [
                          // Image with dimming effect
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/Technical.jpg',
                              fit: BoxFit.cover,
                              color: Colors.black
                                  .withOpacity(0.5), // Dim the image
                              colorBlendMode:
                                  BlendMode.darken, // Apply darken effect
                              width: 350,
                              height: 200,
                            ),
                          ),
                          // Text on top of the image
                          const Positioned(
                            left: 80,
                            top: 10,
                            child: Text(
                              "Technical Events",
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            left: 15,
                            child: AnimatedOpacity(
                              opacity: _TechnicalOpacity,
                              duration: const Duration(milliseconds: 500),
                              child: const SizedBox(
                                width: 330,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Discover a world of innovation at our hackathons and a spectrum of tech events. Join us to elevate your skills and connect with a vibrant community of tech enthusiasts.",
                                    style: TextStyle(
                                      color: Colors.white, // Text color
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Overall Development
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 1850,
                    child: SizedBox(
                      width: 350,
                      height: 200, // Adjust height as needed
                      child: Stack(
                        children: [
                          // Image with dimming effect
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/Overall.jpg',
                              fit: BoxFit.cover,
                              color: Colors.black
                                  .withOpacity(0.5), // Dim the image
                              colorBlendMode:
                                  BlendMode.darken, // Apply darken effect
                              width: 350,
                              height: 200,
                            ),
                          ),
                          // Text on top of the image
                          const Positioned(
                            left: 65,
                            top: 10,
                            child: Text(
                              "Overall Development",
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            left: 10,
                            child: SizedBox(
                              width: 330,
                              child: Align(
                                alignment: Alignment.center,
                                child: AnimatedOpacity(
                                  opacity: _OverallDOpacity,
                                  duration: const Duration(milliseconds: 500),
                                  child: const Text(
                                    "Ignite holistic growth with us! Our programs fuse tech skills, personal development, and community engagement, creating a supportive environment for your advancement.",
                                    style: TextStyle(
                                      color: Colors.white, // Text color
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Workshops
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 2100,
                    child: SizedBox(
                      width: 350,
                      height: 200, // Adjust height as needed
                      child: Stack(
                        children: [
                          // Image with dimming effect
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/Workshop.jpg',
                              fit: BoxFit.cover,
                              color: Colors.black
                                  .withOpacity(0.5), // Dim the image
                              colorBlendMode:
                                  BlendMode.darken, // Apply darken effect
                              width: 350,
                              height: 200,
                            ),
                          ),
                          // Text on top of the image
                          const Positioned(
                            left: 120,
                            top: 10,
                            child: Text(
                              "Workshop",
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            left: 10,
                            child: SizedBox(
                              width: 330,
                              child: Align(
                                alignment: Alignment.center,
                                child: AnimatedOpacity(
                                  opacity: _WorkshopOpacity,
                                  duration: const Duration(milliseconds: 500),
                                  child: const Text(
                                    "Dive into practical learning with expert-led workshops! Gain valuable skills and real-world insights in a dynamic environment. Join us for a transformative experience.",
                                    style: TextStyle(
                                      color: Colors.white, // Text color
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //What We do section
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 2400,
                    child: AnimatedOpacity(
                      opacity: _aboutUsOpacity,
                      duration: const Duration(milliseconds: 500),
                      child: AnimatedOpacity(
                        opacity: _WhatWeDoOpacity,
                        duration: const Duration(milliseconds: 500),
                        child: Column(
                          children: [
                            const Text(
                              'What We Do',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'neue',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              height: 3,
                              width: 180,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.red,
                                    Colors.amber,
                                    Colors.green,
                                    Colors.blue,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //What we do desc
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 2460,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 20,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: _WhatWeDoOpacity,
                          child: const Text(
                            "Welcome to GDSC-DJSCE , where one gets immense knowledge from the campaigns, workshops, and other events.Shaping tomorrow's world, TODAY!",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOut,
                      top: MediaQuery.of(context).size.height / 2 + 2660,
                      left: _Position,
                      child: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              "App Development",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ))),

                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOut,
                      top: MediaQuery.of(context).size.height / 2 + 2730,
                      right: _Position,
                      child: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              "Web Development",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ))),
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOut,
                      top: MediaQuery.of(context).size.height / 2 + 2800,
                      left: _Position,
                      child: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              "Machine Learning",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ))),
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOut,
                      top: MediaQuery.of(context).size.height / 2 + 2870,
                      right: _Position,
                      child: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              "Marketing",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ))),
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOut,
                      top: MediaQuery.of(context).size.height / 2 + 2940,
                      left: _Position,
                      child: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              "Creatives",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ))),
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOut,
                      top: MediaQuery.of(context).size.height / 2 + 3010,
                      right: _Position,
                      child: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              "Logistics",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ))),
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeInOut,
                      top: MediaQuery.of(context).size.height / 2 + 3080,
                      left: _Position,
                      child: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              "Publicity",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
