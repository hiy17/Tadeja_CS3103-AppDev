import 'package:flutter/material.dart';
import 'package:flutter_application_2/login_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Jude Tadeja',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 6), // Space between name and icon
                      Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 25,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('Following', '17'),
                      _buildStatColumn('Followers', '1.5k'),
                      _buildStatColumn('Posts', '485'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: _drawerSections(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 16, // Reduced font size for the count
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12, // Reduced font size for the label
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  List<Widget> _drawerSections(BuildContext context) {
    return [
      _buildAnimatedListTile(
        context,
        icon: Icons.school,
        title: 'Education',
        page: const EducationPage(),
      ),
      _buildAnimatedListTile(
        context,
        icon: Icons.build,
        title: 'Skills',
        page: const SkillsPage(),
      ),
      _buildAnimatedListTile(
        context,
        icon: Icons.book_online,
        title: 'Projects',
        page: const ProjectsPage(),
      ),
      _buildAnimatedListTile(
        context,
        icon: Icons.work,
        title: 'Experience',
        page: const ExperiencePage(),
      ),
    ];
  }

  Widget _buildAnimatedListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget page,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const curve = Curves.easeInOut;
              final tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
              final fadeAnimation = animation.drive(tween);
              final scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(animation);

              return FadeTransition(
                opacity: fadeAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: child,
                ),
              );
            },
          ),
        );
      },
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome, Jude!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Other Pages
class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildEnhancedPage(
      context,
      title: 'Education',
      icon: Icons.school,
      description:
          'Bachelor of Science in Computer Science\n'
          'Batangas State University - The NEU - Alangilan\n'
          '•3rd Year - CS3103\n'
          '•Class of 2021 - Present\n\n'
          'Relevant Coursework:\n'
          '• Application Development\n'
          '• Web Systems & Technologies\n'
          '• Mobile Computing\n'
          '• Automata Theory & Formal Languages',
      backgroundColor: Colors.blueAccent.withOpacity(0.1),
    );
  }
}

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildEnhancedPage(
      context,
      title: 'Skills',
      icon: Icons.build,
      description:
          '• Learning Flutter and Dart\n'
          '• Experienced in web development (HTML, CSS, JavaScript)\n'
          '• Problem-solving and algorithmic skills\n'
          '• Familiar with Python and Java\n'
          '• Knowledge of responsive design and UI/UX principles\n'
          '• Version control with Git and GitHub',
      backgroundColor: Colors.greenAccent.withOpacity(0.1),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildEnhancedPage(
      context,
      title: 'Projects',
      icon: Icons.book_online,
      description:
          '1. **MedMemo: Health and Symptom Tracking App**\n'
          '   - A mobile app for tracking health symptoms and sharing logs with healthcare providers.\n\n'
          '2. **Shade Parade: Color Palette Organizer**\n'
          '   - A web app for organizing and visualizing color palettes based on lightness and hue.\n\n'
          '3. **Portfolio Website**\n'
          '   - A personal responsive web portfolio showcasing my skills and projects.',
      backgroundColor: Colors.orangeAccent.withOpacity(0.1),
    );
  }
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildEnhancedPage(
      context,
      title: 'Experience',
      icon: Icons.work,
      description: 'No experience to display.',
    );
  }
}

Widget _buildEnhancedPage(
  BuildContext context, {
  required String title,
  required IconData icon,
  required String description,
  Color backgroundColor = Colors.white,
}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      backgroundColor: Colors.blueAccent,
      elevation: 4.0,
    ),
    body: AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 600),
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 20.0),
              elevation: 5,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(icon, size: 50, color: Colors.blueAccent),
                    title: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      description,
                      style: const TextStyle(fontSize: 18, color: Colors.black, height: 1.6),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
