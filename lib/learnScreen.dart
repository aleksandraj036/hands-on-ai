import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SecondRoute extends StatelessWidget {
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
              child: Padding( padding: EdgeInsets.only(top:45, left: 25, right:25),
                              child: Column(
          children: [
            OutlinedButton.icon(style: OutlinedButton.styleFrom(
                    
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.only(top: 80, bottom: 80,left: 20, right:20),
                    textStyle: TextStyle(
                      inherit: true,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      
                    ),
                    side: BorderSide(color: Colors.blueAccent[700], width: 4),
                  ),
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRouteAI()),
                    );
                  }, 
                  label: FaIcon(FontAwesomeIcons.arrowRight),
                  icon: Text("Aritificial Intelligence", textAlign: TextAlign.center,)),

                  SizedBox(height: 30),

                  OutlinedButton.icon(
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
                  }, 
                  
                  icon: FaIcon(FontAwesomeIcons.arrowLeft),
                  label: Text("Machine Learning")),


                  SizedBox(height: 30),

                  OutlinedButton.icon(
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
                    side: BorderSide(color: Colors.blueAccent[100], width: 4),
                  ),
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRouteDL()),
                    );
                  }, 
                  label: FaIcon(FontAwesomeIcons.arrowDown),
                  
                  icon: Text("Deep Learning", textAlign: TextAlign.center,))
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                                width: 20,
                              ),
                              Text(snapshot.data.docs[index]['desc']),
                              Image.network(snapshot.data.docs[index]['img']),
                              
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

class SecondRouteAI extends StatelessWidget {
  final ref = FirebaseFirestore.instance.collection("Artificial Intelligence");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artificial Intelligence"),
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                                width: 20,
                              ),
                              Image.network(snapshot.data.docs[index]['img']),
                              SizedBox(height: 20),
                              Text(snapshot.data.docs[index]['desc'] /*, style: TextStyle(fontStyle: FontStyle.italic)*/),
                              SizedBox(height: 20),
                              Text(snapshot.data.docs[index]['descII']),
                              SizedBox(height: 20),
                              Text(snapshot.data.docs[index]['descIII']),
                              SizedBox(height: 20),
                              Text(snapshot.data.docs[index]['descIV']),
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

class SecondRouteDL extends StatelessWidget {
  final ref = FirebaseFirestore.instance.collection("Deep Learning");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deep Learning"),
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                                width: 20,
                              ),
                              //Image.network(snapshot.data.docs[index]['img']),
                              //Text(snapshot.data.docs[index]['desc']),
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