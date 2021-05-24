import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sbsc_todo_app/screens/search_location.dart';
import 'package:sbsc_todo_app/util/text_style.dart';

class WeatherResult extends StatelessWidget {
  final String location;
  final int degree;

  const WeatherResult({Key key, this.location, this.degree}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random numb = Random();
    int temp = numb.nextInt(33);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: (temp <= 10)
                      ? AssetImage("assets/images/colld.png")
                      : (temp <= 25)
                          ? AssetImage("assets/images/rain.png")
                          : AssetImage("assets/images/hot.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
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
                Text(
                  'TEAM EARTH',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.apartment,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddLocation())),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  '${location}',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(text: '${temp.toString()}', style: h1Text),
                    TextSpan(
                      text: '°',
                      style: h1Text,
                    ),
                    TextSpan(
                      text: 'C',
                      style: h1Text,
                    ),
                    (temp <= 10)
                        ? TextSpan(
                            text: '🥶',
                            style: h1Text,
                          )
                        : (temp <= 15)
                            ? TextSpan(
                                text: '⛈',
                                style: h1Text,
                              )
                            : (temp <= 25)
                                ? TextSpan(
                                    text: '⛈',
                                    style: h1Text,
                                  )
                                : (temp <= 33)
                                    ? TextSpan(
                                        text: '🌦',
                                        style: h1Text,
                                      )
                                    : TextSpan(
                                        text: '☀️',
                                        style: h1Text,
                                      )
                  ])),
                ),
                SizedBox(height: 20),
                // Center(
                //   child: Text(
                //     '-------------',
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 20,
                //         color: Colors.white),
                //   ),
                // ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: (temp <= 10)
                          ? TextSpan(children: [
                              TextSpan(
                                text:
                                    'It will be Cold 🥶 Outside, Stay Indoors If You Can ',
                                style: h2Text,
                              )
                            ])
                          : (temp <= 15)
                              ? TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Rainy Day, You\'ll Need 🧥 and 🌂',
                                      style: h2Text,
                                    )
                                  ],
                                )
                              : (temp <= 25)
                                  ? TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'It will be Sunny',
                                          style: h2Text,
                                        )
                                      ],
                                    )
                                  : TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'It will be hot you need 🌂',
                                          style: h2Text,
                                        )
                                      ],
                                    )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddLocation()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Center(
                        child: Text(
                      'Search again',
                      style:
                          TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
