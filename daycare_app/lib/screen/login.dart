import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  late String role;

  @override
  Widget build(BuildContext context) {
    // Pastikan argumen role diterima dengan benar
    role = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_login.jpg"), 
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      role == 'Caregiver' ? FontAwesomeIcons.userNurse : FontAwesomeIcons.user,
                      size: 100,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'DAYCARE APP',
                      style:TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Nama',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 255, 68, 168)), 
                      ),
                      validator: (val) => val!.isEmpty ? 'Masukkan Nama' : null,
                      onChanged: (val) {
                        setState(() => username = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Kata Sandi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 245, 58, 248)), 
                      ),
                      obscureText: true,
                      validator: (val) => val!.length < 6 ? 'Masukkan Password lebih dari 6 karakter' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 255, 68, 205),
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Sign In'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('Navigasi ke halaman sesuai peran: $role');
                          Navigator.pushReplacementNamed(context, role == 'Caregiver' ? '/home_caregiver' : '/home_parent');
                        }
                      },
                    ),
                    TextButton(
                      child:const Text(
                        'Daftar',
                        style: TextStyle(color: Color.fromARGB(255, 255, 68, 227)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}