import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Align(
              alignment: Alignment.center,  // Aligns the text to the bottom-left
              child: Text(
                'CV Sections',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold, 
                ),
              ),
            ),
          ),
          // Education section
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Education'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EducationPage()),
              );
            },
          ),
          // Skills section
          ListTile(
            leading: const Icon(Icons.build),
            title: const Text('Skills'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SkillsPage()),
              );
            },
          ),
          // Projects section
          ListTile(
            leading: const Icon(Icons.book_online),
            title: const Text('Projects'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProjectsPage()),
              );
            },
          ),
          // Experience section
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text('Experience'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExperiencePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Example placeholder pages for each section
class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Education')),
      body: const Center(child: Text('Education content goes here')),
    );
  }
}

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skills')),
      body: const Center(child: Text('Skills content goes here')),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: const Center(child: Text('Projects content goes here')),
    );
  }
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experience')),
      body: const Center(child: Text('Experience content goes here')),
    );
  }
}