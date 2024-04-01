import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Example',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Sederhana'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 233, 14, 91), // Warna background pink
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
              'images/logo.jpg',), 
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _pushSettingsPage(context);
                    },
                    child: Text('Pengaturan'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showMenu(context);
                    },
                    child: Text('Home'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _popPage(context);
                    },
                    child: Text('Back'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pushSettingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  void _showMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 100, 100), // Posisi menu
      items: [
        PopupMenuItem(
          child: Text('Menu Pertama'),
          value: 1,
        ),
        PopupMenuItem(
          child: Text('Menu Kedua'),
          value: 2,
        ),
        PopupMenuItem(
          child: Text('Menu Ketiga'),
          value: 3,
        ),
      ],
    );
  }

  void _popPage(BuildContext context) {
    Navigator.pop(context);
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child:  Text(
    '<<<<BE WAITING FOR MAINTENANCE>>>>')
             ),
    );
  }
}