import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/pages/home.dart';
import 'package:flutter_application_3/features/chatbot/to_chat.dart';
import 'package:flutter_application_3/features/task%20manager/go_to_task.dart';
import 'default.dart';

class HomePage extends StatefulWidget {


  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    const HomeScreen(),
    const StartTask(),
    const Default(),
    const Charlie(),
  ];
  int myCurrentIndex = 0;
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      //buttom navigation
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (value) => setState(() => currentIndex = value),
      items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        ),
      BottomNavigationBarItem(
        icon: Icon(Icons.task), 
        label: 'Tasks',
        ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book), 
        label: 'Quiz',
        ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat), 
        label: 'ChatBot',
        ),
     ]),
    );
  }
}

