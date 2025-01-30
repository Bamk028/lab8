import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lab8/pages/mainfoodpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // ตรวจสอบว่าผู้ใช้ล็อกอินอยู่หรือไม่
    User? currentUser = FirebaseAuth.instance.currentUser;
    
    if (currentUser == null) {
      return Scaffold(
        body: Center(
          child: Text('User is not logged in.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        actions: [
          IconButton(
            onPressed: () async {
              // ออกจากระบบ
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
              if (!mounted) return;
              // เปลี่ยนหน้าไปยัง Mainfoodpage หลังจากออกจากระบบ
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Mainfoodpage()),
                (Route<dynamic> route) => false, // ลบหน้าทั้งหมดใน stack
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ตรวจสอบการแสดงข้อมูลจาก Firebase
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(currentUser.photoURL ?? ''),
              child: currentUser.photoURL == null
                  ? Icon(Icons.person, size: 50)
                  : null,
            ),
            SizedBox(height: 20),
            Text(
              currentUser.displayName ?? 'No Display Name',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              currentUser.email ?? 'No Email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              currentUser.metadata.lastSignInTime?.toString() ??
                  'No sign-in time available',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
