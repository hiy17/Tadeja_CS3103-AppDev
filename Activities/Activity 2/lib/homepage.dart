import 'package:flutter/material.dart';
import 'package:flutter_application_2/appdrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My CV',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: const AppDrawer(), // The drawer is included here
      backgroundColor: const Color(0xFFF5F5F5), // Set background color to smoke white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
          children: <Widget>[
            // Profile section centered on the first page
            Center(
              child: Column(
                children: [
                  // Container for the CircleAvatar with a border
                  Container(
                    width: 130, // Width of the container
                    height: 130, // Height of the container
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Make it circular
                      border: Border.all(
                        color: Colors.blue, // Border color
                        width: 4.0, // Border width
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 60, // Radius of the CircleAvatar
                      backgroundImage: AssetImage('lib/assets/idjude.jpg'),
                    ),
                  ),
                  const SizedBox(height: 16), // Spacing between avatar and text
                  const Text(
                    'Jude Tadeja',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('BS Computer Science',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),
                  const Text(
                    '+63 966 793 ****',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10), // Extra spacing before contact
                  const Text(
                    'judetadeja17@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30), // Spacing before CV content

            // Additional CV content

            const SizedBox(height: 20), // Spacing before the box

            // Blank white box below "Professional Goal"
            Container(
              width: double.infinity, // Takes full width of the screen
              height: 150, // Height of the white box
              color: Colors.white, // Background color of the box
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'Professional Goal',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), // Keep it blank or add some text if needed
                ),
              ),
            ),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }
}
