import 'package:flutter/material.dart';
import '../screens/crop_recommendation_screen.dart';
import '../screens/blog_screen.dart';
import '../screens/weather_screen.dart';
import '../screens/pest_detection_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'AgriSmart',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Crop Recommender'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CropRecommendationScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Agricultural Blogs'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BlogScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Weather Update'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeatherScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Pest/Plant Detection'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PestDetectionScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
