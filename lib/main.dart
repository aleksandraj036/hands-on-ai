import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
/*import 'package:youtube_player_flutter/youtube_player_flutter.dart';*/
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Hands-On AI',
    home: Homescreen(),
  ));
}

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

class SecondRoute extends StatelessWidget {
  //final ref = FirebaseFirestore.instance.collection("Machine Learning");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn about AI!"),
        backgroundColor: Colors.black,
        shape: Border(
            bottom: BorderSide(color: Colors.blueAccent),
            top: BorderSide(color: Colors.blueAccent)),
      ),
      body: Center(
              child: Padding( padding: EdgeInsets.only(top:45),
                              child: Column(
          children: [
            OutlinedButton(style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.only(top: 80, bottom: 80,left: 20, right:20),
                    textStyle: TextStyle(
                      inherit: true,
                      fontSize: 33.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      
                    ),
                    side: BorderSide(color: Colors.blueAccent, width: 4),
                  ),
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRouteML()),
                    );
                  }, child: Text("Aritificial Intelligence", textAlign: TextAlign.center,)),

                  SizedBox(height: 30),

                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.only(top: 70, bottom: 70, left: 25, right:25),
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
                      MaterialPageRoute(builder: (context) => SecondRouteML()),
                    );
                  }, child: Text("Machine Learning")),


                  SizedBox(height: 30),

                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.only(top: 60, bottom: 60, left: 15, right:15),
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
                      MaterialPageRoute(builder: (context) => SecondRouteML()),
                    );
                  }, child: Text("Deep Learning"))
          ],
        ),
              ),
      )
    );
  }
}

class SecondRouteML extends StatelessWidget {
  final ref = FirebaseFirestore.instance.collection("Machine Learning");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Machine Learning"),
        backgroundColor: Colors.black,
        shape: Border(
            bottom: BorderSide(color: Colors.blueAccent),
            top: BorderSide(color: Colors.blueAccent)),
      ),
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                snapshot.data.docs[index]['name'],
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Image.network(snapshot.data.docs[index]['img']),
                              Text(snapshot.data.docs[index]['desc']),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'XfYmia3q2Ow',
    params: YoutubePlayerParams(
      playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
      startAt: Duration(seconds: 30),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  YoutubePlayerController _controller_two = YoutubePlayerController(
    initialVideoId: 'XfYmia3q2Ow',
    params: YoutubePlayerParams(
      //playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
      startAt: Duration(seconds: 30),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  YoutubePlayerController _controller_three = YoutubePlayerController(
    initialVideoId: '4tkgOzQ9yyo',
    params: YoutubePlayerParams(
      //playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
      startAt: Duration(seconds: 30),
      showControls: true,
      showFullscreenButton: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get inspired!"),
        backgroundColor: Colors.black,
        shape: Border(
            bottom: BorderSide(color: Colors.blueAccent),
            top: BorderSide(color: Colors.blueAccent)),
      ),
      /*body: (
        SingleChildScrollView(
          child: Center(
            child: Column(
            children: <Widget> [
              Card(
                  child: YoutubePlayerIFrame(
    controller: _controller,
    aspectRatio: 16 / 9,
),
              ),
              Card(
                  child: YoutubePlayerIFrame(
    controller: _controller_three,
    aspectRatio: 16 / 9,
),
              ),
              Card(
                  child: YoutubePlayerIFrame(
    controller: _controller_two,
    aspectRatio: 16 / 9,
),
              ),
            ],
          )
          )
        )
        ),
        );*/

      body: Center(
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Card(
                child: YoutubePlayerIFrame(
                  controller: _controller,
                  aspectRatio: 16 / 9,
                ),
              ),
            ),
            /*Card(
              child: YoutubePlayerIFrame(
                controller: _controller_two,
                aspectRatio: 16 / 9,
              ),
            ),*/
          ]),
        ),
      ),
    );
  }
}
