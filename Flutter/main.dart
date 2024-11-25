import 'package:crop/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'screens/crop_recommendation_screen.dart';
import 'screens/blog_screen.dart';
import 'screens/weather_screen.dart';
import 'screens/pest_detection_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriSmart',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainApp(),
        '/crop_recommendation': (context) => const CropRecommendationScreen(),
        '/blogs': (context) => BlogScreen(),
        '/weather': (context) => const WeatherScreen(),
        '/pest_detection': (context) => const PestDetectionScreen(),
      },
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgriSmart'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(children: [
          const SizedBox(height: 100,),
          const Text(
          "Welcome to AgriSmart!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20,),
          const Text(
            "Your go-to app for smarter farming with personalized crop recommendations, AI-powered pest and plant detection, real-time weather updates, and engaging agriculture blogs. Simplify your farming decisions and maximize yields with ease!",
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300 ),
          ),
          const SizedBox(height: 100,),
          Image.network('https://www.fieldbee.com/wp-content/uploads/2020/10/farming-technology2.jpg'),
        ],
        )
      ),
      )
    );
  }
}
