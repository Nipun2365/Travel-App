import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  String _photoUrl = ''; // Placeholder for photo URL
  String _phoneNumber = ''; // Placeholder for phone number
  String _address = ''; // Placeholder for address
  String _email = ''; // Placeholder for email

  void _updateProfile() {
    // Implement logic to update profile information
    // This could involve sending data to a backend server or updating local storage
    // For now, let's just print the updated information
    print('Updated Photo URL: $_photoUrl');
    print('Updated Phone Number: $_phoneNumber');
    print('Updated Address: $_address');
    print('Updated Email: $_email');
  }

  Future<void> _selectPhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _photoUrl = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: _selectPhoto,
                child: CircleAvatar(
                  radius: 80,
                 backgroundImage: _photoUrl.isNotEmpty
        ? FileImage(File(_photoUrl))
        : const AssetImage('assets/default_avatar.png') as ImageProvider,

                  // Placeholder image if photo URL is empty
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (value) {
                  _phoneNumber = value;
                },
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Address',
                  prefixIcon: Icon(Icons.location_on),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (value) {
                  _address = value;
                },
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (value) {
                  _email = value;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _updateProfile,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
