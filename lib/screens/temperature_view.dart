import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sbsc_todo_app/screens/search_location.dart';
import 'package:sbsc_todo_app/util/text_style.dart';

class Temperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/waterFall.png"),
                  fit: BoxFit.cover,
                ),
              ),
              // child: null /* add child content here */,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddLocation())),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height /2.7,
                    ),

                    Center(
                        child: Text("TEAM EARTH",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w900))),
                   Center(
                        child: Text("Weather App",
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.w500))),
                                Center(
                        child: Text("Where Your Forecast Begins",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w700))),
SizedBox(height: 20),
                                Center(
                      child: Text("Click the 🔍 to begin ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w900))),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// var listOfWeatherText = [
//   'Please stay indoors ☃',
//   ''

// ]
