import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'onboarding_screen.dart'; // Import your Onboarding screen

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image
            Image.asset(
              'assets/ic_eco_trash_bank_logo.png', // Make sure to put this image in your assets folder
              width: 250,
              height: 250,
            ),
            SizedBox(height: 16), // Space between logo and title
            // Title
            Text(
              'ECO TRASH',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Spacer(), // Push the button to the bottom
            // Start Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the Onboarding screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Custom background
                  onPrimary: Colors.black, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                child: Text(
                  'Mulai',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor:
          Color(0xFFEFEFEF), // Match your splash screen background color
    );
  }
}
