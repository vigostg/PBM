import 'package:flutter/material.dart';

class LoginSelectionPage extends StatelessWidget {
  const LoginSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_cover.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                ("images/child_care.jpg"),
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Daycare APP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 230, 68, 255),
                  ),
                ),
                const SizedBox(height: 40.0),
                _buildElevatedButton(context, 'Caregiver'),
                const SizedBox(height: 20.0),
                _buildElevatedButton(context, 'Parents'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, String userType) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double value, Widget? child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 230, 68, 255),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                userType,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login', arguments: userType);
              },
            ),
          ),
        );
      },
    );
  }
}