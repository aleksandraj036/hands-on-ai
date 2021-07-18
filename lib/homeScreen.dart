import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'learnScreen.dart';
import 'videoScreen.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Hands-On AI',
            style: TextStyle(
                inherit: true,
                fontSize: 52.0,
                color: Colors.red,
                shadows: [
                  Shadow(
                      // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: Colors.white),
                  Shadow(
                      // bottomRight
                      offset: Offset(1.5, -1.5),
                      color: Colors.white),
                  Shadow(
                      // topRight
                      offset: Offset(1.5, 1.5),
                      color: Colors.white),
                  Shadow(
                      // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: Colors.white),
                ]),
          ),
          centerTitle: true,
          flexibleSpace: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image/better_brain.jpg'),
                  fit: BoxFit.contain,
                ),
                border: Border(
                    bottom: BorderSide(color: Colors.blueAccent),
                    top: BorderSide(color: Colors.blueAccent)),
              ),
            ),
          ),
          toolbarHeight: 400,
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              child: Text(
                'Learn about AI!',
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: TextStyle(
                  inherit: true,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                side: BorderSide(color: Colors.blueAccent, width: 4),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
            OutlinedButton.icon(
              icon: Text('Get inspired!'),
              label: FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: TextStyle(
                  inherit: true,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                side: BorderSide(color: Colors.blueAccent, width: 4),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdRoute()),
                );
              },
            )
          ],
        )));
  }
}