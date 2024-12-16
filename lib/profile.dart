// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

import 'package:travel_app/login.dart';
import 'package:travel_app/profile_edit.dart';

class Profile extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  const Profile({super.key, Key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
    appBar: AppBar(
  backgroundColor: Colors.blue,
  automaticallyImplyLeading: true,
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.black),
   onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
  ),
  actions: [
    const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    
                  ),
                ),
    IconButton(
      icon: const Icon(Icons.logout, color: Colors.red),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      },
    ),
  ],
),



      body: SingleChildScrollView(
       child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage:
                    AssetImage('images/profile.png'), // Change the image path as needed
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
               
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileEdit()),
                );
              },
              child: const Center(
                child: Text(
                  'View Profile',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    
                  ),
                ),
              ),
            ),
  
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileEdit()),
                );
              },
              child: const ListTile(
                leading: Icon(Icons.wine_bar, color: Colors.black),
                title: Text(
                  'My Rewards',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
           
           GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEdit()),
    );
  },
  
    child: const ListTile(
      leading: Icon(Icons.card_giftcard, color: Colors.black),
    
      title: Text(
        'Gift Card',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  ),


            
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileEdit()),
                );
              },
            child:const ListTile(
              leading: Icon(Icons.card_membership, color: Colors.black),
              title: Text(
                'My Coupon',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ),
            
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileEdit()),
                );
              },
            child:const ListTile(
              leading: Icon(Icons.message, color: Colors.black),
              title: Text(
                'Your Contributions',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ),
            
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileEdit()),
                );
              },
            child:const ListTile(
              leading: Icon(Icons.car_rental, color: Colors.black),
              title: Text(
                'Car Rental',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ),
            
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileEdit()),
                );
              },
            child:const ListTile(
              leading: Icon(Icons.badge, color: Colors.black),
              title: Text(
                'Bookings',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ),
            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEdit()),
    );
  },
  child: const ListTile(
    leading: Icon(Icons.star, color: Colors.black),
    title: Text(
      'Give a Feedback',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ),
),
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEdit()),
    );
  },
  child: const ListTile(
    leading: Icon(Icons.help, color: Colors.black),
    title: Text(
      'Get help',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ),
),
            const SizedBox(height: 10.0),
            const Text(
              'Contact Information:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
           

            
GestureDetector(
  
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEdit()),
    );
  },
  child: const ListTile(
    leading: Icon(Icons.email, color: Colors.black),
    title: Text(
      'nipunkanishka41.@gmail.com',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ),
),

            
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEdit()),
    );
  },
  child: const ListTile(
    leading: Icon(Icons.phone, color: Colors.black),
    title: Text(
      '+94740743369',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ),
),
            
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileEdit()),
    );
  },
  child: const ListTile(
    leading: Icon(Icons.location_on, color: Colors.black),
    title: Text(
      'Sri Lanka',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ),
),  
          ],
        ),
      ),
      ),
    );
  }
}
