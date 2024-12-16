import 'package:flutter/material.dart';

import 'package:travel_app/package1.dart';
import 'package:travel_app/package2.dart';
import 'package:travel_app/package3.dart';

class AllPackages extends StatefulWidget {
  const AllPackages({Key? key}) : super(key: key);

  @override
  State<AllPackages> createState() => _AllPackagesState();
}

class _AllPackagesState extends State<AllPackages> {
  final TextEditingController _searchController = TextEditingController();

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
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 100),
                child: SizedBox(
                  width: 250, // Adjust the width as needed
                  height: 50,
                  child: Text(
                    "Our Services",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                color: Colors.black,
                iconSize: 30,
                onPressed: () {
                  // Add filter functionality here
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              height: 45,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 100),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search a Location",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {
                            _searchController.clear(); // Clear the text field
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         Expanded(
            child: SingleChildScrollView(
             
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20, width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 24),
                        GestureDetector(
                          onTap: () {
                            // Navigate to another page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Package1()),
                            );
                          },
                          child: popularDestination('images/place13.jpeg', "Dhilli", "India"),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            // Navigate to another page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Package2()),
                            );
                          },
                          child: popularDestination('images/place14.jpeg', "Paris", "France"),
                        ),
                        const SizedBox(width: 20),
                        
                        const SizedBox(width: 6),
                      ],
                    ),
                    const SizedBox(height: 20, width: 10),
                    Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 21),
                        GestureDetector(
                          onTap: () {
                            // Navigate to another page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Package3()),
                            );
                          },
                          child: popularDestination('images/place10.jpeg', "Pannala", "Sri Lanka"),
                        ),
                        const SizedBox(width: 20),
                        popularDestination('images/place4.jpeg', "Paris", "France"),
                        const SizedBox(width: 20),
                       
                       
                      ],
                    ),
                    const SizedBox(height: 20, width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 21),
                        popularDestination('images/place7.jpeg', "Paris", "France"),
                        const SizedBox(width: 20),
                        popularDestination('images/place8.jpeg', "Paris", "France"),
                        const SizedBox(width: 20),
                        
                      ],
                    ),
                    const SizedBox(height: 20, width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 21),
                        popularDestination('images/place10.jpeg', "Paris", "France"),
                        const SizedBox(width: 20),
                        popularDestination('images/place11.jpeg', "Paris", "France"),
                        const SizedBox(width: 20),
                       
                      ],
                    ),
                    const SizedBox(height: 20, width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 21),
                        popularDestination('images/place13.jpeg', "Paris", "France"),
                        const SizedBox(width: 21),
                        popularDestination('images/place14.jpeg', "Paris", "France"),
                        const SizedBox(width: 20),
                       
                      ],
                    ),
                    const SizedBox(height: 20, width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 21),
                        popularDestination('images/place13.jpeg', "Paris", "France"),
                        const SizedBox(width: 20),
                        popularDestination('images/place14.jpeg', "Paris", "France"),
                        const SizedBox(width: 20),
                       
                      ],
                    ),
                    // Add more rows if needed
                  ],
                ),
              ],
            ),
          ),
         ),
        ],
      ),
    );
  }

  Widget popularDestination(String img, String city, String country) {
    return Container(
      padding: const EdgeInsets.fromLTRB(2, 2, 2, 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      height: 180,
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            img,
            height: 125,
            width: 200,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            city,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            country,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
