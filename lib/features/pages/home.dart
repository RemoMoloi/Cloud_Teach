import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myitems = [
    Image.asset('assets/images/business.jpg'),
    Image.asset('assets/images/cat.jpg'),
    Image.asset('assets/images/english.jpg'),
    Image.asset('assets/images/geography.jpg'),
    Image.asset('assets/images/lifeScience.jpg'),
    Image.asset('assets/images/maths.jpg'),
    Image.asset('assets/images/mathsLit.jpg'),
    Image.asset('assets/images/physics.jpg'),
  ];

  int myCurrentIndex = 0;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Image.asset('assets/images/background.jpg').color,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Dashboard'),
        actions: [
         const Center(
          child: Text(
            'Log out',
            ),
            ),
         IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
            ),
        ],
      ),
     body:  ListView(
        children: [
           Column(
          children: [
            carousel(),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Marks(),
            ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                     gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xff1f005c),
                        Color(0xff5b0060),
                        Color(0xff870160),
                
            ],
            tileMode: TileMode.mirror,
          ),
           ),
                  child: const Column(
          children: [
           Text(
            "Test your knowledge",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Take a quiz from your favorite subjects, icluding (English, Maths, Maths Lit, Business, Geography, Computer Application Technology, Life Science and Physical Science) and test your knowledge, just click on "Quiz" and choose your subject',
                 style: TextStyle(fontSize: 18, color: Colors.white),
                 ),
                 ),
                  ),
                ],
              ),
              ),
                
              ],
            ),
            const SizedBox(height: 20,),
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
            
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ], 
            tileMode: TileMode.mirror,
          ),
                  ),
            
                  child: const Column(
        children: [
           Text(
            "Charlie the AI",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Center(
              child: Text(
                'Meet Charlie, your personal AI ChatBot here to assist you get information straight from your pocket, click on "ChatBot" to meet your new friend',
                 style: TextStyle(fontSize: 20, color: Colors.white),
                 ),
                 ),
          ),
        ],
      ),
                ),
          ],

        ),
        ]
      ),
    );
  }

  //carousel to display images
  SingleChildScrollView carousel() {
    int myCurrentIndex = 0;
    return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                  height: 200,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  },
                     ), 
                      items: myitems,
                     ),
                ),
              AnimatedSmoothIndicator(activeIndex: myCurrentIndex,
            count: myitems.length,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 10,
              dotColor: Colors.grey.shade200,
              activeDotColor: Colors.grey.shade900,
              paintStyle: PaintingStyle.fill,
            ),
            ),
            ],
            ),
          );
  }
}

class Marks extends StatelessWidget {
  const Marks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 350,
      decoration: const BoxDecoration(
       gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromARGB(255, 0, 101, 101),
              Color.fromARGB(255, 45, 174, 234),
            ],
            tileMode: TileMode.mirror,
          ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: const Column(
        children: [
           Text(
            "Task Manager",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Cloud Teach provides you with a tool to manage your task and get better with time management, especially in your exam season. Nonetheless, click on "Tasks" and get started!',
                 style: TextStyle(fontSize: 20, color: Colors.white),
                 ),
                 ),
          ),
        ],
      ),
    );
  }
}
