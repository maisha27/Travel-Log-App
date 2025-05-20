import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final Color deepSeaGreen = const Color(0xFF264F5C);
  final Color blueLagoon = const Color(0xFF007A8C);
  final Color skyBlue = const Color(0xFF6bafa9);

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.restaurant, 'name': 'Restaurants'},
    {'icon': Icons.hotel, 'name': 'Hotels'},
    {'icon': Icons.mosque, 'name': 'Mosques'},
    {'icon': Icons.park, 'name': 'Parks'},
    {'icon': Icons.history_edu, 'name': 'Historical Sites'},
    {'icon': Icons.museum, 'name': 'Museums'},
    {'icon': Icons.festival, 'name': 'Events'},
    {'icon': Icons.shopping_bag, 'name': 'Shopping'},
    {'icon': Icons.landscape, 'name': 'Natural Sites'},
  ];

  final List<Map<String, dynamic>> places = [
    {
      'name': 'Central Park',
      'image': 'assets/res4.jpg',
      'description': 'Beautiful park in the heart of the city',
      'rating': 4.5,
      'distance': '1.5 km'
    },
    {
      'name': 'History Museum',
      'image': 'assets/his1.jpg',
      'description': 'Explore the city\'s rich history',
      'rating': 4.8,
      'distance': '2.3 km'
    },
    {
      'name': 'Hotel Risotto',
      'image': 'assets/res3.jpg',
      'description': 'Vintage Hotel to Heal Your Heart',
      'rating': 4.2,
      'distance': '2.5 km'
    },
    {
      'name': 'Pizzaria',
      'image': 'assets/res2.jpg',
      'description': 'Savour the Most Delicious Pizza!',
      'rating': 4.3,
      'distance': '3.3 km'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              _buildWeatherSection(),
              _buildCategoriesSection(),
              _buildPlacesSection('Nearby Places', places),
              _buildPlacesSection('Popular Places', places),
              _buildPlacesSection('Recently Visited', places),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
           colors: [deepSeaGreen, blueLagoon],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Welcome Back, James!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to profile page
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: ClipOval(
                child: Image.asset(
                  'assets/res4.jpg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
           colors: [
            blueLagoon,
            skyBlue
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.wb_sunny, size: 40, color: Colors.orange),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Current Weather',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Text(
                '25°C - Sunny',
                style: TextStyle(fontSize: 14,
                 color: Colors.white),
               
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return _buildCategoryItem(
                categories[index]['icon'],
                categories[index]['name'],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(IconData icon, String name) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
             color: deepSeaGreen.withValues(alpha: 26),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: blueLagoon),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildPlacesSection(String title, List<Map<String, dynamic>> placesList) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        height: 280, // Adjusted height for new card design
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: placesList.length,
          itemBuilder: (context, index) {
            return _buildPlaceCard(placesList[index]);
          },
        ),
      ),
    ],
  );
}

  Widget _buildPlaceCard(Map<String, dynamic> place) {
  return Container(
    width: 200,
    margin: const EdgeInsets.only(right: 16),
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Handle card tap - can navigate to detail view
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Overlay Section
            Stack(
              children: [
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    place['image'],
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120,
                      color: deepSeaGreen.withValues(alpha: 50),
                      child: Icon(Icons.image_not_supported, 
                        color: deepSeaGreen.withValues(alpha: 100)),
                    ),
                  ),
                ),
                // Dark overlay for better text contrast
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white, skyBlue
                        ],
                      ),
                    ),
                  ),
                ),
                // Rating badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: blueLagoon,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${place['rating']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    place['name'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: deepSeaGreen,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Description
                  Text(
                    place['description'],
                    style: TextStyle(
                      fontSize: 12,
                      color: deepSeaGreen.withValues(alpha: 150),
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Distance
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: blueLagoon,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        place['distance'],
                        style: TextStyle(
                          fontSize: 12,
                          color: deepSeaGreen.withValues(alpha: 150),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Action Buttons
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: deepSeaGreen.withValues(alpha: 50),
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton(
                    Icons.info_outline,
                    'Details',
                    () {
                      // Handle details
                    },
                  ),
                  _buildActionButton(
                    Icons.favorite_border,
                    'Favorite',
                    () {
                      // Handle favorite
                    },
                  ),
                  _buildActionButton(
                    Icons.bookmark_border,
                    'Save',
                    () {
                      // Handle save
                    },
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

// Helper method for action buttons
Widget _buildActionButton(IconData icon, String tooltip, VoidCallback onPressed) {
  return Expanded(
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Tooltip(
            message: tooltip,
            child: Icon(
              icon,
              size: 20,
               color: blueLagoon,
            ),
          ),
        ),
      ),
    ),
  );
}

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
      setState(() {
          _currentIndex = index;
        });
        if (index == 2) { // Profile tab
          Navigator.pushNamed(context, '/profile');
        }
      },
      selectedItemColor: blueLagoon, // Add this to change selected item color
      unselectedItemColor: deepSeaGreen.withValues(),
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