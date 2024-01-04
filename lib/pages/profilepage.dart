import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:test_firebase/pages/loginpage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  void _navigateToHistory(BuildContext context) {
    Navigator.pushNamed(context, '/history');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const  Center(
         child: Text('Profile Page'),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assests/profile.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ronak',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => _navigateToHistory(context),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history),
                  SizedBox(width: 10),
                  Text('View History'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // GestureDetector(
            //   onTap: () => _logout(context),
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(Icons.logout),
            //       SizedBox(width: 10),
            //       Text('Logout'),
            //     ],
            //   ),
            // ),
          ],
        ),
      )
    );
    
  }
}