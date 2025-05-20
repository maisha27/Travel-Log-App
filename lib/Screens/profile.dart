import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Color deepSeaGreen = const Color(0xFF264F5C);
  final Color blueLagoon = const Color(0xFF007A8C);
  final Color skyBlue = const Color(0xFF6bafa9);

  // Mock data for user logs
  final List<Map<String, dynamic>> userLogs = [
    {
      'date': '2025-05-20',
      'placeName': 'Central Park',
      'image': 'assets/res4.jpg',
      'description': 'Beautiful day at the park!'
    },
    {
      'date': '2025-05-19',
      'placeName': 'History Museum',
      'image': 'assets/his1.jpg',
      'description': 'Exploring local history'
    },
    {
      'date': '2025-05-18',
      'placeName': 'Hotel Risotto',
      'image': 'assets/res3.jpg',
      'description': 'Amazing stay!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(),
              _buildActionButtons(),
              _buildLogsSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildProfileHeader() {
    return Stack(
      children: [
        // Cover Image
        Container(
          height: 200,
          width: double.infinity,
          child: Image.asset(
            'assets/travel-bg2.jpg', // Add your cover image to assets
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    skyBlue, blueLagoon
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        // Profile Content
        Column(
          children: [
            const SizedBox(height: 120),
            Center(
              child: Column(
                children: [
                  // Profile Image
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 47,
                        backgroundImage: const AssetImage('assets/profile.jpg'),
                        backgroundColor: blueLagoon,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Name
                  Text(
                    'James',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Username
                  Text(
                    '@james45',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
}

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/edit-profile');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: blueLagoon,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Edit Profile',
             style: TextStyle(color: Colors.white,),),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              // Handle follow action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: deepSeaGreen,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Follow',
            style: TextStyle(color: Colors.white,),
          ),
          )
        ],
      ),
    );
  }

  Widget _buildLogsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Logs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: deepSeaGreen,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: userLogs.length,
          itemBuilder: (context, index) {
            return _buildLogCard(userLogs[index]);
          },
        ),
      ],
    );
  }

  Widget _buildLogCard(Map<String, dynamic> log) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              log['image'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date
                Text(
                  log['date'],
                  style: TextStyle(
                    color: deepSeaGreen.withValues(alpha: 150),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                // Place Name
                Text(
                  log['placeName'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: deepSeaGreen,
                  ),
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  log['description'],
                  style: TextStyle(
                    color: deepSeaGreen.withValues(alpha: 200),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // View Details Button
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton.icon(
              onPressed: () {
                // Handle view details
              },
              icon: Icon(Icons.visibility, color: blueLagoon),
              label: Text(
                'View Details',
                style: TextStyle(color: blueLagoon),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: 2, // Profile tab
      selectedItemColor: blueLagoon,
      unselectedItemColor: deepSeaGreen.withValues(alpha: 150),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note),
          label: 'Logs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Logout',
        ),
      ],
    );
  }
}