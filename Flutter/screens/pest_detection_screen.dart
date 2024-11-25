// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PestDetectionScreen extends StatefulWidget {
  const PestDetectionScreen({super.key});

  @override
  _PestDetectionScreenState createState() => _PestDetectionScreenState();
}

class _PestDetectionScreenState extends State<PestDetectionScreen> {
  File? _pickedImage;
  String _result = "No results yet!";
  bool _isImageLoaded = false;
  bool _isProcessing = false;

  // Initialize Image Labeler
  late ImageLabeler _imageLabeler;

  @override
  void initState() {
    super.initState();
    final options = ImageLabelerOptions(confidenceThreshold: 0.6); // Adjust threshold if needed
    _imageLabeler = ImageLabeler(options: options);
  }

  Future<void> _getImageFromGallery() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _pickedImage = File(pickedFile.path);
          _isImageLoaded = true;
          _result = "Image loaded. Click 'Label' to start!";
        });
      } else {
        setState(() {
          _result = "No image selected.";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Error selecting image: $e";
      });
    }
  }

  Future<void> _getImageFromCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _pickedImage = File(pickedFile.path);
          _isImageLoaded = true;
          _result = "Image loaded. Click 'Label' to start!";
        });
      } else {
        setState(() {
          _result = "No image captured.";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Error capturing image: $e";
      });
    }
  }

  Future<void> _getImageFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final directory = await getTemporaryDirectory();
        final file = File('${directory.path}/temp_image.jpg');
        await file.writeAsBytes(response.bodyBytes);

        setState(() {
          _pickedImage = file;
          _isImageLoaded = true;
          _result = "Image loaded from URL. Click 'Label' to start!";
        });
      } else {
        setState(() {
          _result = "Failed to fetch image from URL.";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Error loading image from URL: $e";
      });
    }
  }

  Future<void> _labelImage() async {
    if (_pickedImage == null) {
      setState(() {
        _result = "Please select or load an image first!";
      });
      return;
    }

    setState(() {
      _isProcessing = true;
      _result = "Processing...";
    });

    try {
      final inputImage = InputImage.fromFilePath(_pickedImage!.path);
      final List<ImageLabel> labels = await _imageLabeler.processImage(inputImage);

      if (labels.isNotEmpty) {
        setState(() {
          _result = labels.map((label) {
            return "${label.label} (${(label.confidence * 100).toStringAsFixed(2)}%)";
          }).join("\n");
        });
      } else {
        setState(() {
          _result = "No labels detected.";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Error labeling image: $e";
      });
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  @override
  void dispose() {
    _imageLabeler.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final urlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pest Detection"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _getImageFromGallery,
                  icon: const Icon(Icons.photo),
                  label: const Text("Gallery"),
                ),
                ElevatedButton.icon(
                  onPressed: _getImageFromCamera,
                  icon: const Icon(Icons.camera),
                  label: const Text("Camera"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                hintText: "Enter Image URL",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: () {
                    if (urlController.text.isNotEmpty) {
                      _getImageFromUrl(urlController.text);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            _isImageLoaded
                ? Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.file(
                      _pickedImage!,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Text("No image selected."),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _isProcessing ? null : _labelImage,
              icon: const Icon(Icons.search),
              label: const Text("Label Image"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
