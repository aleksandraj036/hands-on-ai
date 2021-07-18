import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
        body: Center(
          child: Column(
                      children: [SizedBox(height: 100),
                      Text('Playlist with intresting videos related to Artificial Intelligence', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20), textAlign: TextAlign.center),
                      SizedBox(height: 50),
                      Card(
                child: YoutubePlayerIFrame(
              controller: _controller,
              aspectRatio: 16 / 9,
            )),
          ],
        )));
  }
}
