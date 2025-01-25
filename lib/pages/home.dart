import 'package:flutter/material.dart';
import 'package:lab8/services/auth_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            authServices.signInWithGoogle().then(
              (value) {
                print(value);
              },
            );
          },
          icon: Image.network(
            'https://www.google.com/images/branding/product/1x/gsa_512dp.png',
            width: 24,
            height: 24,
          ),
          label: Text(
            'Sign in with Google',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // สีพื้นหลังปุ่ม
            side: BorderSide(color: Colors.grey), // เส้นขอบปุ่ม
            elevation: 4, // เงาปุ่ม
            padding: EdgeInsets.symmetric(
                horizontal: 16, vertical: 8), // ระยะขอบในปุ่ม
          ),
        ),
      ),
    );
  }
}
