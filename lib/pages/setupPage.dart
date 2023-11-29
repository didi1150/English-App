import 'package:eng_app_v2/components/secondaryScaffold.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SellProduct extends StatefulWidget {
  const SellProduct({super.key});

  @override
  State<SellProduct> createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SecScaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: Text('Pick Image from Camera'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                textStyle: const TextStyle(color: Colors.blue)),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: Text('Pick Image from Gallery'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                textStyle: const TextStyle(color: Colors.blue)),
          ),
          SizedBox(height: 16),
          _image != null
              ? Image.file(
                  _image!,
                  height: 100,
                )
              : Container(),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Process form data, e.g., send it to a server
              String description = _descriptionController.text;
              String name = _nameController.text;
              Navigator.pop(context);
              // Do something with description, name, and _image
              print('Description: $description');
              print('Name: $name');
              print('Image path: ${_image?.path}');
            },
            child: Text('Submit'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                textStyle: const TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    ));
  }
}
