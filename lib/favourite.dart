// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';


class Favourite extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  const Favourite({super.key, Key});

  @override
  State<Favourite> createState() => _FavouriteState();

  static void remove(String s) {}

  static void add(String s) {}
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: const Row(
        children: [
          SizedBox(
            height: 60,
            width: 200,
            child: Center(
              child: Text(
                "Your Favourite",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
