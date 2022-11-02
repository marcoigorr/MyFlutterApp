// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage ({ Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MyFlutterApplication'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          // Empty box just to create space between
          SizedBox(height: 50,),

          // Logo image
          FlutterLogo(
            size: 150,
          ),

          // Title Centered
          Center(
            heightFactor: 4,
            child: Text(
              'Welcome To MyApp!',
              style: Theme.of(context).textTheme.bodyText1,
              ),
          ),

          // Button 

          Container(
            padding: EdgeInsets.only(left: 110.0, right: 110.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              child: Text('Here goes nothing', style: Theme.of(context).textTheme.button,),
            ),
          ),
        ],
      ),      
    );
  }
}