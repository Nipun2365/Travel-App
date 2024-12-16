import 'package:flutter/material.dart';
import 'package:travel_app/book_filight_page.dart';

class Package3 extends StatefulWidget {
  const Package3({Key? key}) : super(key: key);

  @override
  State<Package3> createState() => _Package3State();
}

class _Package3State extends State<Package3> {
  bool isFavorite = false;
  bool isStar = false; // Declare the isStar variable
  bool isBookmarked = false;
  bool isImage2 = false;

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
          Row(
            children: [
              const Text(
                'Favourite',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                    Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.transparent,
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/place5.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              height: MediaQuery.of(context).size.height / 2, // Adjust the height as needed
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "City name, Country",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 95), // Add some space between the text and the star icon
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isStar = !isStar;
                                    });
                                  },
                                  child: Icon(
                                    isStar ? Icons.star : Icons.star_border,
                                    color: isStar ? Colors.yellow : Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 5), // Add some space between the star icon and the rating text
                                const Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                         
                        ),
                       const SizedBox(height: 25),
const Text(
  "This is a sample text to demonstrate the use of the Text widget in Flutter. "
  "It includes several parameters like style, textAlign, overflow, and more.",
  style: TextStyle(
    color: Colors.black,
    fontSize: 17,
  ),
  textAlign: TextAlign.justify,
),
 const SizedBox(height: 20),
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      Padding(
        padding: EdgeInsets.only(right: 5),
        child: SizedBox(
          width: 120,
          height: 90,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'images/place1.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 5),
        child: SizedBox(
          width: 120,
          height: 90,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'images/place2.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 5),
        child: SizedBox(
          width: 120,
          height: 90,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'images/place3.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 5),
        child: SizedBox(
          width: 120,
          height: 90,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'images/place4.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 5),
        child: SizedBox(
          width: 120,
          height: 90,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'images/place5.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      
    ],
  ),
),



const SizedBox(height: 40),

Container(
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    
    Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
          boxShadow: [],
        ),
        child: GestureDetector(
          onTap: () {
            // Navigate to another page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookFlightPage()),
            );
          },
          child: Text(
            "Book Now",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ],
  ),
),
GestureDetector(
  onTap: () {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  },
  child: Container(
  padding: const EdgeInsets.all(5),
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black, // Border color
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Stack(
    alignment: Alignment.center,
    children: [
      Icon(
        Icons.bookmark_border,
        color: Colors.black, // Outline color
        size: 40,
      ),
      Icon(
        Icons.bookmark,
        color: isBookmarked ? Colors.red : Colors.transparent, // Solid color
        size: 40,
      ),
    ],
  ),
),



                        // Add more widgets as needed
),
  ],
                  ),
),
                      ],
            ),
                  ),
                ],
      ),
          ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Package3(),
  ));
}
