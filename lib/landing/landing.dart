// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage ({ Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MyFlutterApplication'),
      ),

      body: SingleChildScrollView( 
        child: Column(
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
            CreateText(4, 'Welcome To MyApp', true, context),

            // Button 
            Container(
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                child: Text('Here goes nothing', style: Theme.of(context).textTheme.button,),
              ),
            ),
          ],
        ),  
      ), 

      // footer
      bottomSheet: Container(
        height: 60.0,
        alignment: Alignment.center,
        child: Text(
          'Copyright 2022 Marco Petronio',
          style: Theme.of(context).textTheme.bodySmall,
          ),
      ),
    );
  }

  Widget CreateText(double hFactor, String text, bool title, BuildContext context) {
    if (title) {    
      return Center(
        heightFactor: hFactor,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
    } else {
      return Center(
        heightFactor: hFactor,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ); 
    }
  }
}