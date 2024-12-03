import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/appdrawer.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedImagePath;
  final ImagePicker _picker = ImagePicker();

  // Variables to manage the color change on tap
  bool isLiked = false;
  bool isCommented = false;
  bool isShared = false;

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My CV',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          // Profile Section
          Stack(
            children: [
              // Cover Image
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  image: DecorationImage(
                    image: AssetImage('lib/assets/cover_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 90),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Profile Image with ClipOval
                      ClipOval(
                        child: _selectedImagePath != null
                            ? Image.file(
                                File(_selectedImagePath!),
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'lib/assets/idjude.jpg',
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                      ),
                      // Add/Edit Icon
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Jude Tadeja',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ],
                  ),
                  const Text(
                    '@judetadeja',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        'Philippines',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Followings, Followers, Posts Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatColumn('Following', '17'),
              _buildStatColumn('Followers', '1.5k'),
              _buildStatColumn('Posts', '485'),
            ],
          ),
          const SizedBox(height: 20),
          // Professional Goal Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: _selectedImagePath != null
                          ? Image.file(
                              File(_selectedImagePath!),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'lib/assets/idjude.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Jude Tadeja',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '@judetadeja',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '*Professional Goal*\n'
                            'To create innovative and user-centered web designs that enhance user experiences and contribute to the development of accessible, visually engaging, and responsive frontend solutions.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconButton(
                      icon: Icons.favorite_border,
                      count: '1,743',
                      isActive: isLiked,
                      activeColor: Colors.red,
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                    _buildIconButton(
                      icon: Icons.chat_bubble_outline,
                      count: '186',
                      isActive: isCommented,
                      activeColor: Colors.blue,
                      onTap: () {
                        setState(() {
                          isCommented = !isCommented;
                        });
                      },
                    ),
                    _buildIconButton(
                      icon: Icons.share,
                      count: '93',
                      isActive: isShared,
                      activeColor: Colors.green,
                      onTap: () {
                        setState(() {
                          isShared = !isShared;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String count,
    required bool isActive,
    required Color activeColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: isActive ? activeColor : Colors.grey),
          const SizedBox(width: 5),
          Text(count, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
