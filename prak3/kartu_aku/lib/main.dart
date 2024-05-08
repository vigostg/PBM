import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 10, 99),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/profil.png'),
              ),
              Text(
                'Kartuku',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 45.0,
                  color: Colors.white,
                  // fontWeight: Georgia.bold,
                ),
              ),
              Text(
                'Flutter Devs',
                style: TextStyle(
                  fontFamily: 'SourceSans3',
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Color.fromARGB(255, 221, 6, 103),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+6285880764059',
                    style: TextStyle(
                      color: Color.fromARGB(255, 245, 19, 192),
                      fontFamily: 'SourceSans3',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              )),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '4521210087@univpancasila.ac.id',
                      style: TextStyle(
                        color: Color.fromARGB(255, 245, 19, 192),
                        fontFamily: 'SourceSans3',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}