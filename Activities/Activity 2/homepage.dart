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
      drawer: const AppDrawer(), 
      backgroundColor: const Color(0xFFF5F5F5), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: <Widget>[
           
            Center(
              child: Column(
                children: [
                  
                  Container(
                    width: 130, 
                    height: 130, 
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, 
                      border: Border.all(
                        color: Colors.blue, 
                        width: 4.0, 
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('lib/assets/idjude.jpg'),
                    ),
                  ),
                  const SizedBox(height: 16), 
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
                    '+63 966 793 1872',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10), 
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
            const SizedBox(height: 30), 

            

            const SizedBox(height: 20), 

            
            Container(
              width: double.infinity, 
              height: 150, 
              color: Colors.white, 
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'Professional Goal',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), 
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
