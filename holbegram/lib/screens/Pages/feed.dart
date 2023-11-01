import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Holbegram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 24.0,
              ),
            ),
            SizedBox(width: 8.0), // Add spacing between text and logo
            Image.asset(
              'assets/logo.png', // Replace with the path to your logo image
              width: 24.0, // Set the width of the logo as needed
              height: 24.0, // Set the height of the logo as needed
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add the search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add the notifications functionality here
            },
          ),
        ],
      ),
      body: Posts(), // You'll need to create the Posts widget later
    );
  }
}
