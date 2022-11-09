// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage ({Key? key}) : super (key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      
      body: Column(
        children: [
          const SizedBox(height: 50,),

          const Center(
            child: Text('HomePage'),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        const BottomNavigationBarItem(
          label: 'Code',
          icon: Icon(Icons.code),
        ),
        const BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        const BottomNavigationBarItem(
          label: 'About Me',
          icon: Icon(Icons.person),
        ),
      ]),
    );
  }
}