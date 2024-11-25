// ignore_for_file: library_private_types_in_public_api

import 'package:crop/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CropRecommendationScreen extends StatefulWidget {
  const CropRecommendationScreen({super.key});

  @override
  _CropRecommendationScreenState createState() =>
      _CropRecommendationScreenState();
}

class _CropRecommendationScreenState extends State<CropRecommendationScreen> {
  final nitrogenController = TextEditingController();
  final phosphorusController = TextEditingController();
  final potassiumController = TextEditingController();
  final temperatureController = TextEditingController();
  final humidityController = TextEditingController();
  final phController = TextEditingController();
  final rainfallController = TextEditingController();

  String recommendation = "";

  Future<void> getRecommendation() async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/predict'), // Replace with server URL
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'nitrogen': double.parse(nitrogenController.text),
          'phosphorus': double.parse(phosphorusController.text),
          'potassium': double.parse(potassiumController.text),
          'temperature': double.parse(temperatureController.text),
          'humidity': double.parse(humidityController.text),
          'ph': double.parse(phController.text),
          'rainfall': double.parse(rainfallController.text),
        }),
      );

      if (response.statusCode == 200) {
        final recommendationData = jsonDecode(response.body);
        setState(() {
          recommendation = recommendationData['crop'];
        });
      } else {
        setState(() {
          recommendation =
              "Failed to get recommendation (Code: ${response.statusCode})";
        });
      }
    } catch (e) {
      setState(() {
        recommendation = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Recommendation System'),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () { Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainApp()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("Nitrogen", nitrogenController),
              buildTextField("Phosphorus", phosphorusController),
              buildTextField("Potassium", potassiumController),
              buildTextField("Temperature (°C)", temperatureController),
              buildTextField("Humidity (%)", humidityController),
              buildTextField("pH", phController),
              buildTextField("Rainfall (mm)", rainfallController),

              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: getRecommendation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Get Recommendation'),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  recommendation.isNotEmpty
                      ? recommendation
                      : "Enter data and click 'Get Recommendation'",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: recommendation.contains("Failed")
                        ? Colors.red
                        : Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
