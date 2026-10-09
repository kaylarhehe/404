import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({
    super.key,
    required this.userName,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const Color greyHeader = Color(0xFFA7A7A3);
    const Color greyCard = Color(0xFFA7A7A3);
    const Color textColor = Color(0xFF333333);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: greyHeader,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.black, size: 30),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Chris P. Bacon',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Manage Account',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello Chris!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'What do you wanna do today?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            const SizedBox(height: 24),

            // Option 1: Chat
            _buildOptionCard(
              title: 'Chat With\n404',
              backgroundColor: greyCard,
              imagePath: 'assets/Untitled371_20260823212201.png',
              imageWidth: 200,
              imageHeight: 200,
              onTap: () {},
            ),

            const SizedBox(height: 16),

            // Option 2: Game Card
            _buildOptionCard(
              title: 'Scrolling\nGame',
              backgroundColor: greyCard,
              imagePath: 'assets/Untitled371_20260823212126.png',
              imageWidth: 200,
              imageHeight: 200,
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: greyHeader,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: greyHeader,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Untitled371_20260823212431.png',
                width: 100,
                height: 95,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.chat_bubble_outline_rounded),
              ),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Untitled371_20260823214724.png',
                width: 100,
                height: 95,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.photo_library_outlined),
              ),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Untitled371_20260823212731.png',
                width: 100,
                height: 95,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.smartphone),
              ),
              label: 'Scroll',
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for option cards
  Widget _buildOptionCard({
    required String title,
    required Color backgroundColor,
    required String imagePath,
    double? imageWidth,
    double? imageHeight,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 110,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            // Background grey card
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.only(left: 24, right: 140),
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),

            // Large artwork positioned on the right edge
            Positioned(
              right: 10,
              bottom: -50,
              child: Image.asset(
                imagePath,
                width: imageWidth ?? 150,
                height: imageHeight ?? 150,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}